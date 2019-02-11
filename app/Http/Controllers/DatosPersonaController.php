<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\View;
use App\DatosPersona;
use Illuminate\Http\Request;
use App\Beca;
use App\User;
use App\Provincia;
use App\Localidad;
use App\familiar;
use App\consideracione;
use DB;
use App\Inscripcione;

use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use  Illuminate\Database\Eloquent\Model;
use App\Http\Requests\CrearDatosPersona;
use Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Input;

class DatosPersonaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth'); //solo logeados acceden
        $this->middleware('datosp', ['only' => ['create', 'store', 'index']]); //intercepta only o except
    }




    public function index()
    {
        $dato = DatosPersona::with(['user_name', 'user_id'])->get();
        $user = Auth::user(); 
        $carrera = DB::table('carreras')->get();
        
        
        
        return view('datospersona.index', compact('dato','user','carrera'));

        
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        $user = Auth::user();
        
        $id = DB::table('datos_personas')->where('user_id', $user->id)->get(); //devuelvo todos que encuentra
        

        $beca = DB::table('becas')->join('datos_personas','datos_personas.beca_id','!=','becas.id')
        ->where('habilitada', 1)->select('becas.habilitada','becas.id','datos_personas.beca_id')->get(); 

        $aux = DB::table('becas')->where('habilitada',1)->first();
        $carrera = DB::table('carreras')->get();
        $condicion = DB::table('condicion')->get();

        
        $super=DB::table('datos_personas')
        ->join('becas','datos_personas.beca_id','=','becas.id')
        ->where('datos_personas.user_id',$user->id)
        ->where('becas.habilitada','=',1)
        ->get();

        if(count($super)){
        return redirect('administracion')->with('message','Ya estas inscripto en la beca ');
        //Porque ya esta inscripto en la beca
        }else{
            //No tiene ningun dato cargado
        return view ('datospersona.create', compact('user', 'carrera', 'id', 'condicion','beca','aux'));
        }





        
    }


    public function getLocalidades(Request $request, $id)
    {
        if($request->ajax()){
            $localidad = Localidad::localidades($id);
            return response()->json($localidad);
        }
    }
    public function getCarreras(Request $request, $id)
    {
        if($request->ajax()){
            
            $carrera = DB::table('carreras')->where('id',$id)->get();
            
            return response()->json($carrera);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CrearDatosPersona $request)
    {       
        $beca_aux = DB::table('becas')->where('habilitada', 1)->first(); //Si tiene mas becas habilitada explota adrede y ademas comprobar que no se altero el hidden del form

//            dd($request); 
        if ($beca_aux->id==$request->becaid){

        $random = str_random(100);

         try{
            Storage::makeDirectory($request->becaid."/".$request->dni); //creo el directorio con el dni, para guardar las imagenes
            $ruta_datos=$request->becaid."/".$request->dni;
    
            $datos = new DatosPersona;
            $datos->beca_id = $request->becaid;
            $datos->user_id = $request->user_id;
            $datos->user_apellido = $request->apellido;
            $datos->user_name = $request->nombre;
            $datos->user_dni = $request->dni;
            $datos->cuil = $request->cuil;
            $datos->estado_civil = $request->estcivil;
            $datos->cumple = $request->cumple;
            $datos->domicilio = $request->domi;
            $datos->provincia = $request->provincia;
            $datos->localidad = $request->localidad;
            $datos->cp = $request->cp;
            $datos->km_procedencia=$request->kmprocedencia;
            $datos->nacionalidad = $request->nacionalidad;
            $datos->cel = $request->cel;
            $datos->user_email = $request->email;
            $datos->face = $request->face;
            $datos->disca_estudiante = $request->discaest;
            $datos->condicion_estudiante = $request->cond;
            if($request->cond=="Renovante" or $request->cond=="Nuevo" or $request->cond=="Ingresante"){

                    if ($request->hasFile('constancia')){     
                $img = $request->file('constancia');
                $nombre='constancia_estudiante'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                $img->storeAs($ruta_datos,$nombre);
                $datos->constancia_estudiante = $ruta_datos.'/'.$nombre;
                }
                else{
                }
            
        
            if ( $request->hasFile('certificado') ){     
                $img = $request->file('certificado'); 
                $f=0;
                $rutas = [];
                if(is_array($img)){ 
                    foreach ($img as $contador=>$imagen) {
                        $ext=$imagen->getClientOriginalExtension();
    $nombre='certificado_estudiante-'.$f.'-'.$request->dni.'-'.$random.'.'.$ext;
                        $rutas[]=$imagen->storeAs($ruta_datos,$nombre);
                $datos->certificado_estudiante = collect($rutas)->implode(' - ');
                        $f++;
                    }
                }
                else{
$nombre='certificado_estudiante'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                    $img->storeAs($ruta_datos,$nombre);
                    $datos->certificado_estudiante = $ruta_datos.'/'.$nombre;
                }
            }



            }elseif ($request->cond=="Condicional") {
            
                    if ($request->hasFile('constancia')){     
                $img = $request->file('constancia');
$nombre='constancia_estudiante'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                $img->storeAs($ruta_datos,$nombre);
                $datos->constancia_estudiante = $ruta_datos.'/'.$nombre;
                }
                else{
                }

            } 

            //********************************************************///
            // Para que me devuelva el nombre de la carrera y no el id//
            $datos->carrera_id=$request->carrera_cursa; 
            $aux_carrera = DB::table('carreras')->where('id',$request->carrera_cursa)->first();
            $datos->carrera_cursa = $aux_carrera->nombre;
            /////////////////////////////////////////////////////////////
            $datos->anio_ingreso = $request->anioingreso;
            $datos->anio_cursado = $request->aniocursado;
            
            if($request->cond=="Renovante" or $request->cond=="Nuevo"){
            $datos->cant_materia = $request->cantmaterias;
            $datos->promedio =0;
            }
            elseif($request->cond=="Ingresante"){
            $datos->promedio = $request->promedio;
            $datos->cant_materia=0;
            }
            elseif($request->cond=="Condicional"){
            $datos->cant_materia=0;
            $datos->promedio =0;
            }
            
            $datos->tiene_trabajo = $request->trabaja;
            $datos->tipo_trabajo = $request->actlab;
            $datos->sueldo = $request->sueldo;
            $datos->tiene_beca = $request->beca;
            $datos->tiene_progresar = $request->progresar;
            $datos->tiene_asig = $request->asig;
            $datos->otros_ing = $request->otrosing;
            $datos->otros_ing_cant=$request->otrosingcant;
            $datos->otros_ing_descr=$request->otrosingdescr;
            $datos->domi_cursado = $request->domicursa;
            $datos->casa_fam = $request->casafam;
            $datos->tiene_alq = $request->alq;        
            $datos->monto_alq = $request->montoalq;

            $datos->usa_media_dist = $request->mediadist;
            if($request->mediadist=="Si"){
                $datos->cant_viaja_media = $request->cantviajamedia;
                $datos->precio_pasaje = $request->preciopasaje;
                $datos->cant_km = $request->cantkm;
                

                if ( $request->hasFile('recibopasaj') ){     
                $img = $request->file('recibopasaj'); 
                $ext = $img->getClientOriginalExtension();
    $nombre='recibo_pasaje-'.'-'.$request->dni.'-'.$random.'.'.$ext;
                $img->storeAs($ruta_datos,$nombre);
                $datos->recibo_pasaje = $ruta_datos.'/'.$nombre;
                }
                else{
                }
    
            }


            $datos->usa_urbano = $request->urbano;
            $datos->cant_viajes = $request->cantviaja;


            $datos->larga_distancia =$request->largadist;

            if($request->largadist=="Si"){
                $datos->cant_viaja_larga= $request->cantviajalarga;

                if ( $request->hasFile('recibopasajlarga') ){
                    $img = $request->file('recibopasajlarga');
$nombre='recibo_larga_distancia'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                    $img->storeAs($ruta_datos,$nombre);
                    $datos->recibo_pasaje_larga = $ruta_datos.'/'.$nombre;
                }else{
                //return abort(404);
                }
                
                $datos->cant_km_larga = $request->cantkmlarga;
                $datos->precio_pasaje_larga = $request->preciopasajelarga;
            }

            $datos->es_propietario = $request->propietario;
            $datos->alquila = $request->alquila;
            $datos->precio_alquiler = $request->precioalquiler;
            $datos->prestada = $request->prestada;
            $datos->otros_vivienda = $request->otrosvivienda;
            $datos->tiene_campo = $request->campo;
            $datos->cant_has = $request->has;
            $datos->actividad = $request->actividad;
            $datos->tiene_terreno = $request->terreno;
            $datos->cant_terreno = $request->terrenocant;
            $datos->tiene_auto = $request->auto;
            $datos->cant_auto = $request->autocant;
            $datos->tiene_moto = $request->moto;
            $datos->cant_moto = $request->motocant;
            
            $datos->otros_gastos=$request->otrosgastos;
            if($request->otrosgastos=="Si"){
                $datos->otros_gastos_descripcion=$request->otrosgastoscantdescr;
                $datos->otros_gastos_cant = $request->otrosgastoscant;
                

                if ( $request->hasFile('otrosgastosrecibo') ){
                    $img = $request->file('otrosgastosrecibo');
$nombre='recibo_otros_gastos'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                    $img->storeAs($ruta_datos,$nombre);
                    $datos->otros_gastos_recibo = $ruta_datos.'/'.$nombre;
                }else{
                //return abort(404);
                }

            }    
            


            $datos->motivos = $request->motivos;

              

            
            if ( $request->hasFile('imagen_frente') ){                     // para saber si cargo alguna imagen
                $img = $request->file('imagen_frente');
$nombre='imagen_frente'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                $img->storeAs($ruta_datos,$nombre);
                $datos->imagen_dni_frente = $ruta_datos.'/'.$nombre;
            }else{
                //return abort(404);
            }

        
            if ( $request->hasFile('imagen_dorso') ){
                $img = $request->file('imagen_dorso');
$nombre='imagen_dorso'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                $img->storeAs($ruta_datos,$nombre);
                $datos->imagen_dni_dorso = $ruta_datos.'/'.$nombre;
            }else{
                //return abort(404);
            }
            
        
        
            if ( $request->hasFile('anses') ){     
                    $img = $request->file('anses');
$nombre='certificado_anses'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                    $img->storeAs($ruta_datos,$nombre);
                    $datos->cert_anses = $ruta_datos.'/'.$nombre;
                    
                }
                else{

                }


            
            if ( $request->hasFile('imagendiscaest') ){     
                $img = $request->file('imagendiscaest');
$nombre='certificado_discapacidad'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                $img->storeAs($ruta_datos,$nombre);
                $datos->certificado_discapacidad = $ruta_datos.'/'.$nombre;
                }        
                else{
                }



        
            if ( $request->hasFile('comping1') ){     
                $img = $request->file('comping1');
                $g=0; 
                $rutas = [];
                if(is_array($img)){ 
                    foreach ($img as $contador=>$imagen) {
                        $ext=$imagen->getClientOriginalExtension();
$nombre='comprobante_ingresos-1'.$g.'-'.$request->dni.'-'.$random.'.'.$ext;
                        $rutas[]=$imagen->storeAs($ruta_datos,$nombre);
                        $datos->comprobante_ingresos_1 = collect($rutas)->implode(' - ');
                        $g++;
                    }
                }
                else{
$nombre='comprobante_ingresos-1'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                    $img->storeAs($ruta_datos,$nombre);
                    $datos->comprobante_ingresos_1 = $ruta_datos.'/'.$nombre;
                }
            }
             if ( $request->hasFile('comping2') ){     
                $img = $request->file('comping2');
                $g=0; 
                $rutas = [];
                if(is_array($img)){ 
                    foreach ($img as $contador=>$imagen) {
                        $ext=$imagen->getClientOriginalExtension();
                        $nombre='comprobante_ingresos-2'.$g.'-'.$request->dni.'-'.$random.'.'.$ext;
                        $rutas[]=$imagen->storeAs($ruta_datos,$nombre);
                        $datos->comprobante_ingresos_2 = collect($rutas)->implode(' - ');
                        $g++;
                    }
                }
                else{
                    $nombre='comprobante_ingresos-2'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                    $img->storeAs($ruta_datos,$nombre);
                    $datos->comprobante_ingresos_2 = $ruta_datos.'/'.$nombre;
                }
            }

             if ( $request->hasFile('comping3') ){     
                $img = $request->file('comping3');
                $g=0; 
                $rutas = [];
                if(is_array($img)){ 
                    foreach ($img as $contador=>$imagen) {
                        $ext=$imagen->getClientOriginalExtension();
                        $nombre='comprobante_ingresos-3'.$g.'-'.$request->dni.'-'.$random.'.'.$ext;
                        $rutas[]=$imagen->storeAs($ruta_datos,$nombre);
                        $datos->comprobante_ingresos_3 = collect($rutas)->implode(' - ');
                        $g++;
                    }
                }
                else{
                    $nombre='comprobante_ingresos-3'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                    $img->storeAs($ruta_datos,$nombre);
                    $datos->comprobante_ingresos_3 = $ruta_datos.'/'.$nombre;
                }
            }

            if ( $request->hasFile('reciboalq') ){     
                $img = $request->file('reciboalq');
                $ext = $img->getClientOriginalExtension();
                $nombre='recibo_alquiler'.'-'.$request->dni.'-'.$random.'.'.$ext;
                $img->storeAs($ruta_datos,$nombre);
                $datos->recibo_alquiler = $ruta_datos.'/'.$nombre;
            }
            else{
            }

    
            
            
            if ( $request->hasFile('reciboalqfam') ){     
                $img = $request->file('reciboalqfam'); 
                $nombre='recibo_alquiler_familiar'.'-'.$request->dni.'-'.$random.'.'.$img->getClientOriginalExtension();
                $img->storeAs($ruta_datos,$nombre);
                $datos->recibo_alquiler_familiar = $ruta_datos.'/'.$nombre;
                }
                else{
                }
    

            $datos->save();
            

        
            $id = DB::getPdo()->lastInsertId();;
        //    dd($id);

            if(!empty($request->consideraciones)){

            for ($k=0;$k<count($request->consideraciones);$k++) {
                
                $con = new consideracione;
                $con->datos_id = $datos->id;
                $con->beca_id = $request->becaid;
                
                
                $con->user_id = $request->user_id;
                $con->parentesco = $request->consideraciones[$k]['parentesco'];
                $con->enfermedad = $request->consideraciones[$k]['enfermedad'];
                $con->incapacidad = $request->consideraciones[$k]['incapacidad'];

                
                if($request->consideraciones[$k]['incapacidad']=="Si"){   
                if ( is_file($request->consideraciones[$k]['imagen']) ){
                    $img = $request->consideraciones[$k]['imagen'];
                    $ext = $img->getClientOriginalExtension();
                    $nombre='imagen_discapacidad_familiar-'.$k.'-'.$request->dni.'-'.$random.'.'.$ext;
                    $img->storeAs($ruta_datos,$nombre);
                    $con->cert_incapacidad = $ruta_datos.'/'.$nombre;    
                }else{abort(404);}
            }



                $con->save();
            }
            
            }//cierra el if de empty
            

            if (!empty($request->familiar)){
            for($l=0;$l<count($request->familiar);$l++) {
                $fam = new familiar;
                $fam->datos_id = $datos->id;
                $fam->beca_id = $request->becaid;
                
                Storage::makeDirectory($request->becaid."/".$request->dni."/familiar-".$l);
                 $ruta= $ruta_datos."/familiar-".$l;
                
                $fam->user_id = $request->user_id;
                $fam->parentesco = $request->familiar[$l]['parentesco'];
                $fam->apeynom = $request->familiar[$l]['apeynom'];
                $fam->dni = $request->familiar[$l]['dnifam'];
                $fam->edad = $request->familiar[$l]['edadfam'];
                $fam->ocupacion = $request->familiar[$l]['ocupacionfam'];
                $fam->tiene_trabajo =$request->familiar[$l]['trabaja'];
                
                if($request->familiar[$l]['trabaja']=="Si"){
                    $fam->actividad_laboral = $request->familiar[$l]['actlab'];
                    $fam->ingresos = $request->familiar[$l]['ingresosfam'];
    
                    if ( is_file($request->familiar[$l]['comping1']) ){ 
                        $img = $request->familiar[$l]['comping1'];
                        $con=0;
                        $ext = $img->getClientOriginalExtension();
                        $nombre='comprobante_ingresos_1-'.$l.'-'.$request->dni.'-'.$random.'.'.$ext;
                        $img->storeAs($ruta,$nombre);
                        $fam->comprobante_ingresos_1 = $ruta.'/'.$nombre;    
                    }else{abort(404);}


                        if($request->familiar[$l]['actlab']=="activosfam".$l){
                   
                            if ( is_file($request->familiar[$l]['comping2']) ){ 
                                $img = $request->familiar[$l]['comping2'];
                                $con=0;
                                $ext = $img->getClientOriginalExtension();
                                $nombre='comprobante_ingresos_2-'.$l.'-'.$request->dni.'-'.$random.'.'.$ext;
                                $img->storeAs($ruta,$nombre);
                                $fam->comprobante_ingresos_2 = $ruta.'/'.$nombre;    
                            }else{abort(404);}


                            if ( is_file($request->familiar[$l]['comping3']) ){ 
                                $img = $request->familiar[$l]['comping3'];
                                $con=0;
                                $ext = $img->getClientOriginalExtension();
                                $nombre='comprobante_ingresos_3-'.$l.'-'.$request->dni.'-'.$random.'.'.$ext;
                                $img->storeAs($ruta,$nombre);
                                $fam->comprobante_ingresos_3 = $ruta.'/'.$nombre;    
                            }else{abort(404);}
                            
                        }

                }
                
                if ( is_file($request->familiar[$l]['frente']) ){ 
                    $img = $request->familiar[$l]['frente'];
                    $con=0;
                    $ext = $img->getClientOriginalExtension();
                    $nombre='imagen_dni_familiar-frente-'.$l.'-'.$request->dni.'-'.$random.'.'.$ext;
                    $img->storeAs($ruta,$nombre);
                    $fam->imagen_dni_frente = $ruta.'/'.$nombre;    
                }else{abort(404);}

                if ( is_file($request->familiar[$l]['dorso']) ){ 
                    $img = $request->familiar[$l]['dorso'];
                    $con=0;
                    $ext = $img->getClientOriginalExtension();
                    $nombre='imagen_dni_familiar-dorso-'.$l.'-'.$request->dni.'-'.$random.'.'.$ext;
                    $img->storeAs($ruta,$nombre);
                    $fam->imagen_dni_dorso = $ruta.'/'.$nombre;    
                }else{abort(404);}


                if ( is_file($request->familiar[$l]['ansesfam']) ){ 
                    $img = $request->familiar[$l]['ansesfam'];
                    $con=0;
                    $ext = $img->getClientOriginalExtension();
                    $nombre='comprobante_anses-'.$l.'-'.$request->dni.'-'.$random.'.'.$ext;
                    $img->storeAs($ruta,$nombre);
                    $fam->anses = $ruta.'/'.$nombre;    
                }else{abort(404);}

              $fam->save();
            }
        }//cierra el if del fam vacio
            $inscripto = new Inscripcione();
            $inscripto->Inscribir($request,$datos->id);
        }
           

           /* if (auth()->check()) {
                auth()->user()->datos()->save($datos);
            }

            event(new MessageWasReceived($datos));
            */
        //esta forma sirve cuando sabemos que siempre tenemos un usario autenticado
        //auth()->user()->messages()->create($request->all());

        catch (\Exception $e){
           dd($e);

           // abort(404);//return redirect()->route('datospersona.index')->with('msg', ' Algo salio mal prueba de nuevo.');

        }
        }
         return redirect('/administracion')->with('message', "Felicitaciones, hemos recibido tu inscripcion");//
       

        //meter el alert https://www.youtube.com/watch?v=t2OgwDHKIkQ

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\DatosPersona  $datosPersona
     * @return \Illuminate\Http\Response
     */
    public function show(DatosPersona $datosPersona)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\DatosPersona  $datosPersona
     * @return \Illuminate\Http\Response
     */
    //public function edit(DatosPersona $datosPersona)
    public function edit($user_id)
    {
        $user = Auth::user();

        $carrera = DB::table('carreras')->get();
        $condicion = DB::table('condicion')->get();
        

        //$datos = DatosPersona::findOrFail($user_id);// si descomento esto se edita con el id de datos persona y no con el user_id por eso el datos de abajo VER


        $datos = DB::table('datos_personas')->where('user_id', $user->id)->first(); //devuelvo el primero que encuentra

        return view('datospersona.edit', compact('datos','carrera', 'user','condicion'));
    
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\DatosPersona  $datosPersona
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DatosPersona $datosPersona)
    {

        
       /* $datos_upd = DatosPersona::findOrFail($datosPersona->id);

        $datos_upd->update($request->all());            

        return redirect()->route('datosPersona.index');

        crear la vista..... (datospersona->id andara?=)
        */
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\DatosPersona  $datosPersona
     * @return \Illuminate\Http\Response
     */
    public function destroy(DatosPersona $datosPersona)
    {
        //
    }



    public function revision($id){
        $user = User::find($id);
        //dd($id_user->id);
        $datos = DB::table('datos_personas')->where('user_id', $user->id)->first(); //devuelvo el primero que encuentra
        return $datos->revision;
        }



}
