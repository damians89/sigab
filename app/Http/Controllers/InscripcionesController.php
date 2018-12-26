<?php

namespace App\Http\Controllers;

use App\Inscripcione;
use App\User;
use App\DatosPersona;
use App\familiar;
use App\consideracione;
use Auth;
use PDF;
use View;
use Session;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;
use Yajra\Datatables\Datatables;


use Illuminate\Support\Facades\Storage;

class InscripcionesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
      
    use BreadRelationshipParser;
    /**
     * Display a listing of the resource.
     *
    
     */
    public function index(Request $request)
    {
    if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){ 

        $dato = DB::table('datos_personas')
        ->join('inscripciones', function ($join){
            $join->on('datos_personas.user_id','=','inscripciones.user_id');
        })->get()->toArray(); // devuelvo todos los datos_personas inscriptos
        

        $inscrip = DB::table('inscripciones')
        ->join('users', function ($join) 
            {
                $join->on('inscripciones.user_id','=','users.id');
            })
        ->get();//Devuelvo los que estan inscriptos y son usuarios

        $becas = DB::table('becas')->orderBy('habilitada','desc')->get();


       //dd($dato,$inscrip);
   /*

        $dato = DatosPersona::with(['user_name', 'user_id'])->get();
        $user = Auth::user(); 
        $carrera = DB::table('carreras')->get();
  */   
        
        return view('vendor.voyager.inscripciones.listar', compact('inscrip','dato','becas'));
    }
    else{
        return view('errors.404');
    
    }


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
public function create(Request $request)
    {

        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
                            ? new $dataType->model_name()
                            : false;

        foreach ($dataType->addRows as $key => $row) {
            $details = json_decode($row->details);
            $dataType->addRows[$key]['col_width'] = isset($details->width) ? $details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
public function store(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('edit', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows);

        if ($val->fails()) {
            return response()->json(['errors' => $val->messages()]);
        }

        if (!$request->ajax()) {
            $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

            return redirect()
                ->route("voyager.dashboard")
                ->with([
                        'message'    => __('voyager.generic.successfully_added_new')." {$dataType->display_name_singular}",
                        'alert-type' => 'success',
                    ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
     public function show(Request $request, $id)
    {
        $aaa=session::get('beca');
        //dd($aaa);

        $slug = $this->getSlug($request);
       // $beca=1;
       // InscripcionesController::seleccion($beca);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $relationships = $this->getRelationships($dataType);

        
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

           // dd($model->with($relationships));
            //$dataTypeContent = call_user_func([$model->with($relationships), 'findOrFail'], $id);
        $dataTypeContent = DB::table('inscripciones')->where('id', 1 )->first();


        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        // Replace relationships' keys for labels and create READ links if a slug is provided.
        
        //$dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);
       
        

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check permission
        //$this->authorize('read', $dataTypeContent);

        //dd("asd");

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.read';

     //////////////////////////////////////
        //No llega el request de beca
        
        $request->beca=$aaa;
        $inscrip = DB::table('inscripciones')->join('users', function ($join)
        {
            $join->on('inscripciones.user_id','=','users.id');
        })->where('beca_id','=',$request->beca)->orderBy('inscripciones.merito','desc')->get();//->paginate(3);

        $aux = DB::table('becas')->where('id','=',$request->beca)->select('nombre')->first(); //busco el nombre de la beca
   
        $aux1 = DB::table('datos_personas')->where('beca_id',$request->beca)->get();

        if (view()->exists("voyager::$slug.read")) {
            $view = "voyager::$slug.seleccion";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable','aux','inscrip','aux1'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function generarPdf(Request $request, $beca_id){
     //dd($request,$beca_id);
    if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){ 

     Carbon::SetLocale('es');
     $dt=Carbon::now();
     $dt="Oro Verde, Entre Rios ".$dt->format('d/m/Y - h:m:s');

    //dd($dt->format('l jS \\of F Y h:i:s A'));
    
    //dd($dt);
   

       // dd($inscrip);

    if($request->pdf == "Si"){
        $inscrip = DB::table('inscripciones')->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 'Si')->get(); /*mismas becas*/
        
      
         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt/*, 'user'=>$user*/]);
   
        return $pdf->download('Reporte.pdf');
        }
        elseif ($request->pdf == "No") {
            $inscrip = DB::table('inscripciones')->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 'No')->get();
        //dd($inscrip);
        

         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt/*, 'user'=>$user*/]);
   
        return $pdf->download('Reporte.pdf');
        
            
        }elseif($request->pdf == "Todos"){
            $inscrip = DB::table('inscripciones')->where('beca_id', '=', $beca_id)->get();
        //dd($inscrip);
        

         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt/*, 'user'=>$user*/]);
   
        return $pdf->download('Reporte.pdf');

        }elseif ($request->pdf == "Suspendida") {
            $inscrip = DB::table('inscripciones')->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 'Suspendida')->get();
        //dd($inscrip);
        

         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt/*, 'user'=>$user*/]);
   
        return $pdf->download('Reporte.pdf');


        }elseif($request->pdf == "Pendiente") {
       
        $inscrip = DB::table('inscripciones')->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 'Pendiente')->get();
        //dd($inscrip);
        

         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt/*, 'user'=>$user*/]);
   
        return $pdf->download('Reporte.pdf');


        }else{
                    return view('errors.404');

        }
           
        }else{
        return view('errors.404');
    
    }

}
    
    public function seleccion(Request $request)
    {
    //dd($request);
    if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){ 


        $inscrip = DB::table('inscripciones')->join('users', function ($join)
        {
            $join->on('inscripciones.user_id','=','users.id');
        })->where('beca_id','=',$request->beca)->orderBy('inscripciones.merito','desc')->get();

        $aux = DB::table('becas')->where('id','=',$request->beca)->select('nombre')->first(); //busco el nombre de la beca
   
        $aux1 = DB::table('datos_personas')->where('beca_id',$request->beca)->get();//->paginate(3);
     //dd($inscrip);
/*
        return view('vendor.voyager.inscripciones.seleccion', compact('inscrip','aux','aux1'));
  */  
            return view('vendor.voyager.inscripciones.seleccion', ['inscrip'=>$inscrip]);
  

    }    
    else{
        return view('errors.404');
    
    }

 
    }

    public function datos_usuario(Request $request,$beca_id,$id){
        //dd($beca_id);
          
        $calculos=DB::table('calculos_aux')->leftjoin('becas','calculos_aux.anio','=','becas.anio')->where('becas.id',$beca_id)->select('calculos_aux.*')->first();
        //dd($calculos);

        if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){ 

            

        $datos = DB::table('datos_personas')->where('id','=',$id)->first();
        //dd($datos);
        $condicion = DB::table('condicion')->get();
        $familiar=DB::table('familiars')->where('datos_id',$datos->id)->where('beca_id','=',$beca_id)->get();
        $consideraciones=DB::table('consideraciones')->where('datos_id',$datos->id)->get();
        


        $inscrip=DB::table('inscripciones')->where('datos_id',$datos->id)->first();

        
        
//        dd($datos,$condicion,$familiar,$consideraciones);


        return view('vendor.voyager.inscripciones.usuario.datos_usuario', compact('datos','condicion','familiar','consideraciones','inscrip','calculos'));
          }
            else{
        return view('errors.404');
    
    }

    }

    


    public function getFile($filename)
    {  //No quedo andando esto? 

     return response()->download(storage_path($filename), null, [], null);
    }
  


    public function se_inscribio(){

        
        $user = Auth::user();;
       
        $datos_beca = DB::table('inscripciones')
        //->join('datos_personas',  'inscripciones.user_id', '=', 'datos_personas.user_id')/*datosp en insc*/
        ->join('becas', 'inscripciones.beca_id', '=', 'becas.id') /*mismas becas*/
        //->join('cronogramas', 'becas.id', '=', 'cronogramas.beca_id')/*cronograma de becas*/
        ->where('inscripciones.user_id', '=', $user->id)
        //->select('becas.nombre', 'inscripciones.otorgamiento','becas.anio'/*'cronogramas,.fecha_1', 'cronogramas.fecha_2', 'cronogramas.fecha_3', 'cronogramas.fecha_4', 'cronogramas.fecha_5', 'cronogramas.fecha_6', 'cronogramas.fecha_6', 'cronogramas.fecha_7', 'cronogramas.fecha_8','cronogramas.beca_id' /*'datos_personas.user_name'*/)
        ->get();

       // dd($datos_beca);
        return $datos_beca;//redirect('administracion', compact('dato', $datos_beca));
        }


//Home del voyagerdel comun
    public function revision($id){
        $user = Auth::user();
        $datos_personas = DB::table('datos_personas')->where('user_id', $id)->select('id','revision','beca_id','user_id')->get(); 
       //dd($datos_personas);
      
        return $datos_personas;
        }


    public function carga(Request $request){
       //dd($request);
         Session::put('beca', $request->beca_id);
        try {

            $datos = DatosPersona::where('id',$request->id)->first();

            $fam = Familiar::where('datos_id',$request->id)->get();
            $con = Consideracione::where('datos_id',$request->id)->get();
           
            if ($datos != null) {
            
            if ($request->accion == "acepta") {
                if ($request->revision==1) {
                    $ms="Se informara al usuario que sus datos estan incompletos o incosistentes";
                    $datos->revision = 1;
                    $datos->band =1;
                    $datos->save();
                    } else{
                         $datos->revision = 2;
                         $datos->band = 1; 
                         $datos->save();
                         $ms = "Usuario postulado para la beca";
                     }
                 } else

                  if($request->accion == "modifica"){
                    

                }else
                 if($request->accion=="borra"){
                    $datos = DatosPersona::where('user_id',$request->id)->first();
                    $fam = Familiar::where('user_id',$request->id)->get();
                    $con = Consideracione::where('user_id',$request->id)->get();
                    $datos->delete();
                    $fam->delete();
                    $con->delete();
          
                    $ms = "Datos de inscripcion del usuario borrado con exito";
                }else
                {echo $ms="Ninguna seleccion";}
            }
            

        //return redirect('/administracion/inscripciones')->with('message', $ms);//
        return redirect()->back()->with(['message'=>$ms, 'alert-type'=>'warning']);

        }
        catch (Exception $e) {
            return redirect('administracion/inscripciones')->with('message','Error en la accion con el usuario');
        }

    }


    public function observacion (Request $request, $user_id){
        if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){ 

    
        $inscrip = DB::table('inscripciones')->where('user_id', $user_id)->first();
//        dd($inscrip);     
        return view('vendor.voyager.inscripciones.observacion',compact('inscrip'));
    } 
       else{
        return view('errors.404');
    }
    
    }


    public function guarda_observacion (Request $request){
        $aux_inscripto=DB::table('inscripciones')->where('id',$request->id)->first();
   //dd($request);
                
         Session::put('beca', $aux_inscripto->beca_id);
        if($request->obs_new == NULL & $request->meritos_new==NULL & $request->otorgamiento == NULL){
            return redirect()->back()->with(['message'=>"No escribiste ninguna modificacion!", 'alert-type'=>'error']);
            }
        else{
            if($request->btn=="s"){

                try {
                    //dd($request->id);
                    if($request->otorgamiento=="Suspendida"){
                    $inscrip=DB::table('inscripciones')->where('id',$request->id)
                    ->update([
                        'observacion'=>$request->obs_new, 
                        'merito'=>-1,
                        'otorgamiento'=>$request->otorgamiento
                        ]);
                    //dd($inscrip);
    
                    }else{
                    $inscrip=DB::table('inscripciones')->where('id',$request->id)
                    ->update([
                        'observacion'=>$request->obs_new, 
                        'merito'=>$request->meritos_new,
                        'otorgamiento'=>$request->otorgamiento
                        ]);
                    }


                 return redirect()->route('seleccion')->with(['message'=>"Se guardaron los cambios con exito", 'alert-type'=>'success']);
                }
                catch(Exception $e){
                    echo $e->getMessage();
                    return redirect('/administracion/inscripciones')->with('message','Error no se guardaron los cambios de la observacion');
                }
            }else{
            return redirect()->route('seleccion')->with(['message'=>"No escribiste ninguna modificacion!", 'alert-type'=>'warning']);
            }
        }
    }



/*
Que pueda otorgar solo si estan chequeados los datos y con merito
*/



 
    public function otorgar(Request $request){
        //dd($request);
        Session::put('beca', $request->beca_id);//para que permita relogear

        
       // dd($datos_usuario);

        $datos_beca = DB::table('inscripciones')
        ->where('beca_id', '=', $request->beca_id)->orderBy('inscripciones.merito','desc')->get();

     $cantidad = $datos_beca->count();

     if($request->cant_otor==null){ //Por si no ingresa cantidad de otorgamiento
        return redirect()->back()->with(['message'=>"Falta indicar cuantas becas se otorgaran!", 'alert-type'=>'warning']);
     } 

     
     if ($request->cant_otor > $cantidad) { //Si puso mas becas que inscriptos
       //return redirect('/administracion/inscripciones')->with('message','Error =( Mucha cantidad de becas para pocos postulantes');
        return redirect()->back()->with(['message'=>"Mucha cantidad de becas para pocos postulantes", 'alert-type'=>'warning']);
     }  

      //Inicializo a todos los postulante como NO OTORGADAS!
     $datos_usuario=DB::table('inscripciones')->where('beca_id','=',$request->beca_id)->where('otorgamiento','<>',"Suspendida")->update(['otorgamiento'=>"No"]);
    

     if ($datos_beca == null){ ///Pregunta si existen inscripciones con esa beca
        return redirect()->back()->with(['message'=>"Ningun inscripto en esta beca!", 'alert-type'=>'error']);
    }else//Si existen inscriptos.....
    {
        
        foreach ($datos_beca as $id => $datos) {
         $aux_chequeo=DB::table('datos_personas')->find($datos->datos_id); //Para ver si revisaron todos
       // dd($aux_chequeo->band!=0);
        if($aux_chequeo->band==0){
        return redirect()->back()->with(['message'=>"Faltan revisar los datos de: ".$aux_chequeo->user_name." ".$aux_chequeo->user_apellido." - DNI:".$aux_chequeo->user_dni, 'alert-type'=>'error']);
                }

        }
  


          foreach ($datos_beca as $id => $datos) {//recorro todos los inscriptos
            if ($request->cant_otor > 0) {
                //dd($datos_beca,$id,$datos,$datos->user_id);
                //dd($datos->datos_id);
            $aux_chequeo_sin_completar=DB::table('datos_personas')->find($datos->datos_id); //Para ver si tiene datos completos

          
          if($aux_chequeo_sin_completar->revision==1){
            $ms="El dni: ".$aux_chequeo_sin_completar->user_dni." tiene los datos sin completar";
            $alert="warning";
            }else{

                $d2=DB::table('inscripciones')->where('user_id','=',$datos->user_id)
                ->update(['observacion'=>'Por Orden de Merito', 'otorgamiento'=>'Si']);
                $ms="Becas otorgadas con exito";
                $alert="success";

            }}$request->cant_otor=$request->cant_otor-1;
        }
        //dd($datos_beca);
        return redirect()->back()->with(['message'=>$ms, 'alert-type'=>$alert]);
    }
}



public function update(Request $request){
  //Recibo el nombre de las tablas, y segun la tabla es donde se inserta segun el "campo" y segun el "valor" totalmente random
    if ($request->tabla=='familiar'){
        $consulta=DB::table('familiars')->where('datos_id',$request->idUsuario)->where('beca_id',$request->idBeca)->where('id',$request->idFam)->update([$request->nombre=>$request->valor]);
        return redirect()->back()->with(['message'=>"Modificado con exito!", 'alert-type'=>'success']);
    }
    elseif ($request->tabla=='datos_personas') {
        $consulta=DB::table('datos_personas')->where('id',$request->idUsuario)->where('beca_id',$request->idBeca)->update([$request->nombre=>$request->valor]);
        return redirect()->back()->with(['message'=>"Modificado con exito!", 'alert-type'=>'success']);
    }
    elseif ($request->tabla=='consideraciones') {
        $consulta=DB::table('consideraciones')->where('datos_id',$request->idUsuario)->where('beca_id',$request->idBeca)->where('id',$request->idCon)->update([$request->nombre=>$request->valor]);
        return redirect()->back()->with(['message'=>"Modificado con exito!", 'alert-type'=>'success']);
    }
}



    public function dar_baja_inscripcion(Request $request, $beca, $user_id){
       try{
        $inscrip=DB::table('inscripciones')->where('user_id',$user_id)->delete();
        $datos=DB::table('datos_personas')->where('user_id',$user_id)->delete();
        $fam=DB::table('familiars')->where('user_id',$user_id)->delete();
        $con=DB::table('consideraciones')->where('user_id',$user_id)->delete();
      // dd($user_id,$inscrip,$datos,$fam,$con);
    //if($request->ajax()){
     //$inscrip->delete();
      //  return response()->json(['msg' =>'Borrado!', 'status'=>'success']); 
        Session::put('beca', $beca);    
        /*$inscrip->delete();
        $datos->delete();
        $fam->delete();
        $con->delete();*/ 
   return redirect()->back()->with(['message'=>"Borrado con exito!", 'alert-type'=>'warning'])  ;
    }catch (Exception $e) {
            return redirect('administracion/inscripciones')->with('message','Error en la accion con el usuario');
        }

    }   


    public function merito(Request $request, $datos_id,$beca_id){
       if( (Auth::user()->role_id == '3') or (Auth::user()->role_id == '1')){
        
      //dd($request,$beca_id,$user_id);
          //  dd($request);
        $datos=DB::table('datos_personas')->where('id',$datos_id)->first();
        //dd($datos,$datos_id);
        $fam=DB::table('familiars')->where('datos_id',$datos_id)->get();
        $con=DB::table('consideraciones')->where('datos_id',$datos_id)->get();
        $beca=DB::table('becas')->where('id',$beca_id)->first();
        $carrera= DB::table('carreras')->where('id',$datos->carrera_id)->first();
        $calculos_aux=DB::table('calculos_aux')->where('anio',$beca->anio)->first();
      
        //dd($datos);


                    

        try{
            /*
            /////////////////////////////////////////////////
                PUNTAJE POR PROCEDENCIA
                =km_procedencia*20/4000
            /////////////////////////////////////////////////    
            */

              $aux_pto_procedencia= ($datos->km_procedencia*20/4000);  


            /*
            /////////////////////////////////////////////////
                PUNTAJE TOTAL DE INGRESOS CON LOS FAMILIARES
            /////////////////////////////////////////////////    
            */
                $cant_grupo_familiar=0;
                //Cantidad de grupos familiar +1
                $cant_grupo_familiar=$fam->count()+1;

                //Recorro todos los familiares con sus ingresos sumados
                $ingreso_total_familiar=0;
                $ingreso_familiar=0;
                foreach ($fam as $id => $obj) {
                 $ingreso_familiar = $obj->ingresos+$ingreso_familiar;
                }
                //Sumo los ingresos fam mas los ingresos del postulante
                $ingreso_total_familiar=$ingreso_familiar+$datos->sueldo+$datos->otros_ing_cant;//Falta otros_ingreso

                //suma de alquileres estudiante+familia
                $alquiler_mensual=$datos->monto_alq+$datos->precio_alquiler;

                ///falta otro pasaje?=***//////////
                $transporte=($datos->cant_viajes*$calculos_aux->precio_urbano)+($datos->precio_pasaje*$datos->cant_viaja_media)+($datos->cant_viaja_larga*$datos->precio_pasaje_larga);

                ///Sumatoria de los ingresos y gastos / la cantidad de gente
                $total_ingreso_por_persona=($ingreso_total_familiar-$alquiler_mensual-$transporte-$datos->otros_gastos_cant)/$cant_grupo_familiar;

                $aux_pto_ingresos=0;

                ////Salen los valores de DB::calculos_aux
                if ($total_ingreso_por_persona<($calculos_aux->minimo_vital_movil/10)) {
                    $aux_pto_ingresos=50;
                }else{
                    if($total_ingreso_por_persona<$calculos_aux->minimo_vital_movil){ 
                      $aux_pto_ingresos=(100-1*($total_ingreso_por_persona*100/$calculos_aux->minimo_vital_movil))*0.5;  
                    }else{
                        $aux_pto_ingresos=0;
                    }
                }



            /*
            /////////////////////////////////////////////////
                PUNTAJE POR ENFERMEDADES
            /////////////////////////////////////////////////
            */

            $aux_pto_enfermedad=0;

            if($datos->disca_estudiante == "Si"){      //estudiante tiene discapacidad
                $aux_pto_enfermedad = 10;
            }else{
                $aux_pto_enfermedad=0;
            }


            foreach ($con as $id => $obj) {
                if ($obj->incapacidad == "Si") { //familiar(consideraciones) tiene discapacidad
                    if($aux_pto_enfermedad <20){
                        $aux_pto_enfermedad=$aux_pto_enfermedad+5;
                    }else{

                    }
                }else{

                }
            }
            //tope 20 entre enfermos..... 10 por estudiante y 5 por cada fam que tenga enfermo hasta llegar a 20.... si no es enfermo el estudiante pueden ser hasta 4 enfermos los fam


            
            /*
            /////////////////////////////////////////////////
                PUNTAJE POR SITUACION ACADEMICA
            /////////////////////////////////////////////////    
            */
                ///asignar puntaje por defecto como condicional por situacion academica en la db
                $academico=0;
                $promedio_secundaria=0;
            if($datos->condicion_estudiante=="Ingresante"){
                if($datos->promedio<=6){         
                    $promedio_secundaria=0;
                }else{
                    $promedio_secundaria=($datos->promedio*30/10);
                }
            }

                
                if($datos->condicion_estudiante=="Renovante" or $datos->condicion_estudiante=="Nuevo")
                    {


                        //Cantidad de años de cursado año de beca - año de ingreso
                        $cantidad_de_anio_cursada = ($beca->anio-$datos->anio_ingreso);
                

                        if($carrera->cant_anios==5){
                            $m1=$carrera->primero;
                            $m2=$carrera->segundo+$m1;
                            $m3=$carrera->tercero+$m2;
                            $m4=$carrera->cuarto+$m3;
                            $m5=$carrera->quinto+$m4;
                            $m6=$m5;
                            $m7=$m5;

                        }elseif ($carrera->cant_anios==4) {
                            $m1=$carrera->primero;
                            $m2=$carrera->segundo+$m1;
                            $m3=$carrera->tercero+$m2;
                            $m4=$carrera->cuarto+$m3;
                            $m5=$m4;
                            $m6=$m4;
                            $m7=$m4;

                        }elseif ($carrera->cant_anios==3) {
                            $m1=$carrera->primero;
                            $m2=$carrera->segundo+$m1;
                            $m3=$carrera->tercero+$m2;
                            $m4=$m3;
                            $m5=$m3;
                            $m6=$m3;
                            $m7=$m3;

                        }elseif ($carrera->cant_anios==2) {
                            $m1=$carrera->primero;
                            $m2=$carrera->segundo+$m1;
                            $m3=$m2;
                            $m4=$m2;
                            $m5=$m2;
                            $m6=$m2;
                            $m7=$m2;

                        }
                        switch($cantidad_de_anio_cursada){
                        case 1:  $pmam=$m1*0.2;
                                   $pma = $m1*0.4;

                                if($datos->cant_materia>=$pma){
                                    $academico=30;
                                }elseif ($datos->cant_materia>$pmam) {
                                    $academico=15;
                                }else{
                                    $academico=0;
                                }
                                break;
                        case 2:  $pmam=$m2*0.25;
                                   $pma = $m2*0.5;

                                if($datos->cant_materia>=$pma){
                                    $academico=30;
                                }elseif ($datos->cant_materia>$pmam) {
                                    $academico=15;
                                }else{
                                    $academico=0;
                                } 
                                break;


                        case 3: $pmam=$m3*0.3;
                                $pma = $m3*0.6;

                                if($datos->cant_materia>=$pma){
                                    $academico=30;
                                }elseif ($datos->cant_materia>$pmam) {
                                    $academico=15;
                                }else{
                                    $academico=0;
                                }

                                break;


                        case 4: $pmam=$m4*0.35;
                                   $pma = $m4*0.7;

                                if($datos->cant_materia>=$pma){
                                    $academico=30;
                                }elseif ($datos->cant_materia>$pmam) {
                                    $academico=15;
                                }else{
                                    $academico=0;
                                } 
                                break;
                        case 5: $pmam=$m5*0.4;
                                   $pma = $m5*0.8;

                                if($datos->cant_materia>=$pma){
                                    $academico=30;
                                }elseif ($datos->cant_materia>$pmam) {
                                    $academico=15;
                                }else{
                                    $academico=0;
                                } 
                                break;
                        case 6:$pmam=$m6*0.45;
                                   $pma = $m6*0.9;

                                if($datos->cant_materia>=$pma){
                                    $academico=30;
                                }elseif ($datos->cant_materia>$pmam) {
                                    $academico=15;
                                }else{
                                    $academico=0;
                                } 
                                break;
                        
                        default:$pmam=$m7*0.5;
                                   $pma = $m7*1;

                                if($datos->cant_materia>=$pma){
                                    $academico=30;
                                }elseif ($datos->cant_materia>$pmam) {
                                    $academico=15;
                                }else{
                                    $academico=0;
                                }
                                break;

                        }  
                        //dd($pmam,$pma,$datos->cant_materia);
                        
                    
                }

            
            $aux_pto_academica=$promedio_secundaria+$academico;



            //dd($aux_pto_procedencia,$aux_pto_ingresos,$aux_pto_enfermedad,$aux_pto_academica);
            $aux_merito=$aux_pto_procedencia+$aux_pto_ingresos+$aux_pto_enfermedad+$aux_pto_academica;


            //hasta aca
              $inscripto=DB::table('inscripciones')->where('datos_id',$datos_id)
              ->update([
            'pto_procedencia' => $aux_pto_procedencia,
            'pto_ingresos' => $aux_pto_ingresos,
            'pto_enfermedad' => $aux_pto_enfermedad,
            'pto_academica' => $aux_pto_academica,
            'merito' => $aux_merito,
            'observacion' => 'Por calculo de Merito'
                ]);



            return redirect()->back()->with(['message'=>"Merito calculado con exito!", 'alert-type'=>'warning']);
    }

        catch (\Exception $e){
           dd($e);

            abort(404);//return redirect()->route('datospersona.index')->with('msg', ' Algo salio mal prueba de nuevo.');

        }

        }
        else
            {
                abort(404,"error");
            }
        }






    public function comprobante_beca(Request $request){
    if (Auth::user()->id == $request->user_id){ 
    Carbon::SetLocale('es');
    $dt=Carbon::now();
    $dt="Entre Rios ".$dt->format('d/m/Y - h:m:s');

    $inscrip=DB::table('inscripciones')->join('datos_personas','inscripciones.datos_id','=','datos_personas.id')->where('inscripciones.beca_id','=',$request->beca_id)->where('inscripciones.datos_id',$request->id)->select('inscripciones.id','inscripciones.user_nombre','inscripciones.user_apellido','inscripciones.beca_nombre','inscripciones.created_at')->first();

   //$inscrip->created_at->format('d/m/Y - h:m:s');
    //dd($datos);

    $pdf = PDF::loadView('vendor.voyager.inscripciones.Comprobante_inscripcion',['inscrip'=>$inscrip,'dt'=>$dt/*, 'user'=>$user*/]);
   
        return $pdf->download('Comprobante Inscripcion.pdf');


        }else
        {
            return view('errors.404');

        }
     
    }
    

     public function restablecer(Request $request, $datos_id,$beca_id){
       if( (Auth::user()->role_id == '3') or (Auth::user()->role_id == '1')){
        try{

        $inscrip=DB::table('inscripciones')->where('datos_id',$datos_id)->where('beca_id',$beca_id)->update([
                        'merito'=>0,
                        'pto_procedencia'=>0,
                        'pto_ingresos'=>0,
                        'pto_enfermedad'=>0,
                        'pto_academica'=>0,
                        'observacion'=>"Restablecido",
                        'otorgamiento'=>"Pendiente"
                        ]);
        $datos=DB::table('datos_personas')->where('id',$datos_id)->update([
            'revision'=>0,
            'band'=>0
            ]);
        //dd($inscrip,$datos);

     return redirect()->back()->with(['message'=>"Restablecimiento con exito!", 'alert-type'=>'warning']);

        }
        catch (\Exception $e){
       
            abort(404);//return redirect()->route('datospersona.index')->with('msg', ' Algo salio mal prueba de nuevo.');

        }

         }
     else
        {
            return redirect()->back()->with(['message'=>"Error", 'alert-type'=>'error']);


        }
        }


        public function verificar(Request $request)
        {   //estado = id de beca - x=creacion sin id

            if($request->estado==''){
                $beca=DB::table('becas')->where('habilitada','Si')->count();    
                if ($beca>=1){
                return response (['message'=>"Ya se posee una beca habilitada",'valor'=>'0']);
            }else{
                return response (['message'=>"Estas por habilitar la beca",'valor'=>'1']);
            }   
            }
            else{



            $beca=DB::table('becas')->where('id','<>',$request->estado)->where('habilitada','Si')->count();
            dd($beca);
            if ($beca>=1){
                return response (['message'=>"Ya se posee una beca habilitada",'valor'=>'0']);
            }else{
                return response (['message'=>"Estas por habilitar la beca",'valor'=>'1']);
            }
            }
        }
     




    }


