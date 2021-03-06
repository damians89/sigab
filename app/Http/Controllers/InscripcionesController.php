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
use App\Provincia;
use Session;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;
use Yajra\Datatables\Datatables;
use Response;
use Redirect;

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
    {//estava
        $aaa=session::get('beca_id');
        //dd($aaa);

        $slug = $this->getSlug($request);
       // $beca=1;
       // InscripcionesController::seleccion($beca);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();


        //$relationships = $this->getRelationships($dataType);

        
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

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.read';

        $request->beca_id=$aaa;
        $inscrip = DB::table('inscripciones')
                ->join('users','inscripciones.user_id','=','users.id')
                ->join('datos_personas','datos_personas.id','inscripciones.datos_id')
                ->join('becas','inscripciones.beca_id','becas.id')
                ->join('carreras','inscripciones.carrera_id','carreras.id')
                ->where('inscripciones.beca_id','=',$request->beca_id)->orderBy('inscripciones.merito','desc')
                ->select('users.apellido as user_apellido','inscripciones.otorgamiento as otorgamiento','users.id as user_id','datos_personas.id as datos_id','becas.id as beca_id','users.name as user_nombre','users.dni as dni','carreras.sede_id as sede_nombre','inscripciones.merito as merito','inscripciones.observacion as observacion')
                ->get();


        $aux = DB::table('becas')->where('id','=',$request->beca_id)->select('nombre')->first(); //busco el nombre de la beca
   
        $aux1 = DB::table('datos_personas')->where('beca_id',$request->beca_id)->get();

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
    if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') ){ 
     //   dd($request->all(),$beca_id);

     Carbon::SetLocale('es');
     $dt=Carbon::now();
     $dt="Oro Verde, Entre Rios ".$dt->format('d/m/Y - h:m:s');

    if($request->pdf == "Si"){
        $inscrip = DB::table('inscripciones')
        ->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 1)
        ->join('users','inscripciones.user_id','users.id')
        ->join('carreras','inscripciones.carrera_id','carreras.id')
        ->join('sedes','carreras.sede_id','sedes.id')
        ->select('users.apellido as user_apellido', 'users.name as user_nombre', 'users.dni as user_dni','inscripciones.*','carreras.nombre as carrera_nombre','sedes.nombre as sede_nombre')
        ->get(); 
        //dd($inscrip);
        
      
         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt]);
   
        return $pdf->download('Reporte.pdf');
        }
        elseif ($request->pdf == "No") {
            $inscrip = DB::table('inscripciones')
            ->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 0)
            ->join('users','inscripciones.user_id','users.id')
            ->join('carreras','inscripciones.carrera_id','carreras.id')
            ->join('sedes','carreras.sede_id','sedes.id')
            ->select('users.apellido as user_apellido', 'users.name as user_nombre', 'users.dni as user_dni','inscripciones.*','carreras.nombre as carrera_nombre','sedes.nombre as sede_nombre')->get();

         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt]);
   
        return $pdf->download('Reporte.pdf');
        
            
        }elseif($request->pdf == "Todos"){
            $inscrip = DB::table('inscripciones')
            ->where('beca_id', '=', $beca_id)
            ->join('users','inscripciones.user_id','users.id')
            ->join('carreras','inscripciones.carrera_id','carreras.id')
            ->join('sedes','carreras.sede_id','sedes.id')
            ->select('users.apellido as user_apellido', 'users.name as user_nombre', 'users.dni as user_dni','inscripciones.*','carreras.nombre as carrera_nombre','sedes.nombre as sede_nombre')->get();


            $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt]);
   
        return $pdf->download('Reporte.pdf');

        }elseif ($request->pdf == "Suspendida") {
            $inscrip = DB::table('inscripciones')
            ->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 3)
            ->join('users','inscripciones.user_id','users.id')
            ->join('carreras','inscripciones.carrera_id','carreras.id')
            ->join('sedes','carreras.sede_id','sedes.id')
            ->select('users.apellido as user_apellido', 'users.name as user_nombre', 'users.dni as user_dni','inscripciones.*','carreras.nombre as carrera_nombre','sedes.nombre as sede_nombre')->get();


            $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt]);

            return $pdf->download('Reporte.pdf');


        }elseif($request->pdf == "Pendiente") {
       
        $inscrip = DB::table('inscripciones')
        ->where('beca_id', '=', $beca_id)->where('inscripciones.otorgamiento', 2)
        ->join('users','inscripciones.user_id','users.id')
        ->join('carreras','inscripciones.carrera_id','carreras.id')
        ->join('sedes','carreras.sede_id','sedes.id')
        ->select('users.apellido as user_apellido', 'users.name as user_nombre', 'users.dni as user_dni','inscripciones.*','carreras.nombre as carrera_nombre','sedes.nombre as sede_nombre')->get();


         $pdf = PDF::loadView('vendor.voyager.inscripciones.pdfview',['inscrip'=>$inscrip,'dt'=>$dt]);
   
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
        if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){
            try{
                $inscrip = DB::table('inscripciones')
                ->join('users','inscripciones.user_id','=','users.id')
                ->join('datos_personas','datos_personas.id','inscripciones.datos_id')
                ->join('becas','inscripciones.beca_id','becas.id')
                ->join('carreras','inscripciones.carrera_id','carreras.id')
                ->join('sedes','carreras.sede_id','sedes.id')
                ->where('inscripciones.beca_id','=',$request->beca_id)
                ->orderBy('inscripciones.merito','desc')
                ->select('users.apellido as user_apellido','inscripciones.otorgamiento as otorgamiento','users.id as user_id','datos_personas.id as datos_id','becas.id as beca_id','becas.nombre as beca_nombre','users.name as user_nombre','users.dni as dni','sedes.nombre as sede_nombre','inscripciones.merito as merito','inscripciones.observacion as observacion')
                ->get();

                return view('vendor.voyager.inscripciones.seleccion', compact('inscrip'));
            }catch(Exception $e){
                return redirect()->back()->with(['message'=>"Error al listar los inscriptos", 'alert-type'=>'warning']);
            }
        }
        else{
            return view('errors.404');
        }
    }


    public function datos_usuario2(Request $request){
        //dd($request->all());
            if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){
                $calculos=DB::table('calculos_aux')->leftjoin('becas','calculos_aux.anio','=','becas.anio')->where('becas.id',$request->beca_id)->select('calculos_aux.*')->first();
              

        $datos = DB::table('datos_personas')
        ->where('datos_personas.id','=',$request->datos)
        ->join('carreras','datos_personas.carrera_id','carreras.id')
        ->join('users','datos_personas.user_id','users.id')
        ->join('localidades','datos_personas.localidad_id','localidades.id')
        ->join('provincias','localidades.id_privincia','provincias.id')
        ->where('users.id',$request->user)
        ->select('users.name as user_name',
            'users.id as user_id',
            'users.apellido as user_apellido',
            'users.dni as user_dni',
            'users.email as user_email',
            'datos_personas.beca_id as beca_id',
            'carreras.nombre as carrera_cursa',
            'datos_personas.carrera_id as carrera_id',
            'localidades.localidad as localidad_nombre',
            'provincias.provincia as provincia_nombre',
            'datos_personas.*')
        ->first();

        $carreras=DB::table('carreras')->get();

    
        $inscrip=DB::table('inscripciones')->where('datos_id',$request->datos)->first();
        $familiar=DB::table('familiars')->where('datos_id',$request->datos)->where('beca_id',$request->beca_id)->where('user_id',$request->user)->get();
        
        $consideraciones=DB::table('consideraciones')->where('datos_id',$request->datos)->where('beca_id','=',$request->beca_id)->where('user_id',$request->user)->get();
        $condicion = DB::table('condicion')->get();
        //$provincia = Provincia::pluck('provincia', 'id');
               $provincia = Provincia::pluck('provincia', 'id');
        $provincia->all();

return view('vendor.voyager.inscripciones.usuario.datos_usuario', compact('datos','condicion','familiar','consideraciones','inscrip','calculos','carreras','provincia'));
              }
            else{
                return view('errors.404');
            } 

            
        }

     //prueba para que pueda ver las localidades desde el panel datos_usuario
    public function getLocalidades(Request $request, $id)
    {
        if($request->ajax()){
            $localidad = db::table('localidades')->where('id_privincia',$id)->get();

            return response()->json($localidad);
        }
    }
       
    


    public function getFile($filename)
    { 
     return response()->download(storage_path($filename), null, [], null);
    }
  


    public function se_inscribio(){

        
        $user = Auth::user();;
       
        $datos_beca = DB::table('inscripciones')
        ->join('becas', 'inscripciones.beca_id', '=', 'becas.id')
        ->join('users','inscripciones.user_id','users.id')
        ->join('datos_personas','inscripciones.datos_id','datos_personas.id')
        ->join('carreras','inscripciones.carrera_id','carreras.id')
        ->where('inscripciones.user_id', '=', $user->id)
        ->select('becas.nombre as beca_nombre', 'becas.anio as anio','users.id as user_id','becas.id as beca_id','inscripciones.otorgamiento as otorgamiento')
          ->get();
          //dd($datos_beca);
        return $datos_beca;
        }



//Home del voyagerdel comun
    public function revision($id){
        $user = Auth::user();
        $datos_personas = DB::table('datos_personas')->where('user_id', $id)->select('id','revision','beca_id','user_id')->get(); 
        return $datos_personas;
        }


    public function carga(Request $request){

        try {
            $datos = DatosPersona::where('id',$request->id)->first();
            if ($datos != null) {
                if ($request->revision==1) {
                    $ms="Se informara al usuario que sus datos estan incompletos o incosistentes";
                    $datos->revision = 1; //incorrecto o inconsistentes
                    $datos->band =1; //chequeado los datos
                    $datos->save();
                    } 
                    else{
                         $datos->revision = 2; //postulado
                         $datos->band = 1; //chequeado los datos
                         $datos->save();
                         $ms = "Usuario postulado para la beca";
                     }
                    // $data["message"]=$ms;
                    // $data["alert-type"]="warning";
                    //return $data;
                  //  return  back();
       return redirect('administracion/inscripciones/seleccion')->with(['message'=>$ms, 'alert-type'=>'warning']);
            }
        }
        catch (Exception $e) {
            return redirect('administracion/inscripciones')->with('message','Error en la accion con el usuario');
        }

    }

    public function modificar_datos (Request $request){
        //dd($request->all());
        if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') ){
            $inscrip = DB::table('inscripciones')
            ->join('users','inscripciones.user_id','users.id')
            ->join('datos_personas','inscripciones.datos_id','datos_personas.id')
            ->join('carreras','inscripciones.carrera_id','carreras.id')
            ->join('sedes','carreras.sede_id','sedes.id')
            ->join('becas','inscripciones.beca_id','becas.id')
            ->where('inscripciones.user_id', $request->user)
            ->where('inscripciones.datos_id', $request->datos)
            ->where('inscripciones.beca_id', $request->beca_id)
            ->select('users.apellido as user_apellido','inscripciones.otorgamiento as otorgamiento','users.id as user_id','datos_personas.id as datos_id','becas.id as beca_id','users.name as user_nombre','users.dni as dni','sedes.nombre as sede_nombre','inscripciones.merito as merito','inscripciones.observacion as observacion','inscripciones.id as id')
            ->first();
            return view('vendor.voyager.inscripciones.observacion',compact('inscrip'));
        }
        else
        {
            return view('errors.404');
        }
    }


    public function guarda_observacion (Request $request){

        $aux_inscripto=DB::table('inscripciones')->where('id',$request->id)->first();
           
        if($request->obs_new == NULL & $request->meritos_new==NULL & $request->otorgamiento == NULL){
            return redirect()->back()->with(['message'=>"No escribiste ninguna modificacion!", 'alert-type'=>'error']);
            }
        else{
            if($request->btn=="s"){
                DB::beginTransaction();
                try {
                    if($request->otorgamiento==3){
                    $inscrip=DB::table('inscripciones')->where('id',$request->id)
                    ->update([
                        'observacion'=>$request->obs_new, 
                        'merito'=>-1,
                        'otorgamiento'=>$request->otorgamiento
                        ]);    
                    }else{
                    $inscrip=DB::table('inscripciones')->where('id',$request->id)
                    ->update([
                        'observacion'=>$request->obs_new, 
                        'merito'=>$request->meritos_new,
                        'otorgamiento'=>$request->otorgamiento
                        ]);
                    }
                    DB::commit();

                 return redirect()->route('seleccion')->with(['message'=>"Se guardaron los cambios con exito", 'alert-type'=>'success']);
                }
                catch(Exception $e){
                    DB::rollback();
                    return redirect('/administracion/inscripciones')->with('message','Error no se guardaron los cambios de la observacion');
                }
            }else{
            return redirect()->route('seleccion')->with(['message'=>"No escribiste ninguna modificacion!", 'alert-type'=>'warning']);
            }
        }
    }


    public function otorgar(Request $request){
           DB::beginTransaction();
        try{
            $datos_beca = DB::table('inscripciones')
            ->where('beca_id', '=', $request->beca_id)->orderBy('inscripciones.merito','desc')->get();

            $cantidad = $datos_beca->count();
            if($request->cant_otor==null or $request->cant_otor==0 ){ //Por si no ingresa cantidad de otorgamiento
                return redirect()->back()->with(['message'=>"Falta indicar cuantas becas se otorgaran!", 'alert-type'=>'warning']);

            }

            if ($request->cant_otor > $cantidad) { //Si puso mas becas que inscriptos
                return redirect()->back()->with(['message'=>"Mucha cantidad de becas para pocos postulantes", 'alert-type'=>'warning']);
            }


            if ($datos_beca == null){ ///Pregunta si existen inscripciones con esa beca
                return redirect()->back()->with(['message'=>"Ningun inscripto en esta beca!", 'alert-type'=>'error']);
                }else//Si existen inscriptos.....
                {

                    foreach ($datos_beca as $id => $datos) {//Para ver si revisaron todos
                        $aux_chequeo=DB::table('datos_personas')
                        ->join('users','users.id','datos_personas.user_id')
                        ->where('datos_personas.id',$datos->datos_id)
                        ->select('users.name as user_name','users.apellido as user_apellido','users.dni as user_dni','datos_personas.band as band','datos_personas.revision as revision')
                        ->first();
                        
                        //Veo uno por uno si estan chequedos o no
                        if($aux_chequeo->band==0){
                            return redirect()->back()->with(['message'=>"Faltan revisar los datos de: ".$aux_chequeo->user_name." ".$aux_chequeo->user_apellido." - DNI:".$aux_chequeo->user_dni, 'alert-type'=>'error']);
                        }
                        if($aux_chequeo->revision==1  ){
                            $ms="El Dni: ".$aux_chequeo->user_dni." tiene los datos sin incompletos o inconsistentes";
                            $alert="warning";
                            return redirect()->back()->with(['message'=>$ms, 'alert-type'=>$alert]);
                        }
                    }
                    foreach ($datos_beca as $id => $datos) {//recorro todos los inscriptos
                        if ($request->cant_otor > 0) {

                            $d2=DB::table('inscripciones')
                            ->where('beca_id','=',$request->beca_id)
                            ->where('datos_id','=',$datos->datos_id)
                            ->update(['observacion'=>'Por Orden de Merito', 'otorgamiento'=>1]);

                            $ms="Becas otorgadas con exito";
                            $alert="success";
                            //dd($d2);
                        }
                        else//Los que quedaron afuera de la corte
                        {
                            $datos_usuario=DB::table('inscripciones')
                            ->where('beca_id','=',$request->beca_id)
                            ->where('datos_id','=',$datos->datos_id)
                            ->update(['otorgamiento'=>0,'observacion'=>'Fuera del corte']);
                        }
                        $request->cant_otor=$request->cant_otor-1;
                    }
                }
                $beca=DB::table('becas')->where('id',$request->beca_id)->first();
        

                DB::commit();
                return redirect()->back()->with(['message'=>$ms, 'alert-type'=>$alert,'beca'=>$beca]);
           
        }//cierra el try
        catch (Exception $e){
            DB::rollback();
                $beca=DB::table('becas')->where('id',$request->beca_id)->first();
            return redirect()->back()->with(['message'=>"Problema al realizar la accion", 'alert-type'=>'warning','beca'=>$beca]);
        }
    }


        public function update(Request $request){
  //Recibo el nombre de las tablas, y segun la tabla es donde se inserta segun el "campo" y segun el "valor" totalmente random
            try{

            if($request->nombre=="name" or $request->nombre=="apellido" or $request->nombre=="dni" or $request->nombre=="email"){
                 $consulta=DB::table('users')->where('id',$request->idUsuario)->update([$request->nombre=>$request->valor]);
                 $data=['message'=>"Modificado con exito!", 'alert-type'=>'success',"valor"=>"0"];
                return $data;
            }

            if ($request->tabla=='familiar'){
                $consulta=DB::table('familiars')->where('datos_id',$request->idDatos)->where('user_id',$request->idUsuario)->where('beca_id',$request->idBeca)->where('id',$request->idFam)->update([$request->nombre=>$request->valor]);
                $data=['message'=>"Modificado con exito!", 'alert-type'=>'success',"valor"=>"0"];
                return $data;
            }
            elseif ($request->tabla=='datos_personas') {
                $consulta=DB::table('datos_personas')->where('id',$request->idDatos)->where('beca_id',$request->idBeca)->update([$request->nombre=>$request->valor]);
                $data=['message'=>"Modificado con exito!", 'alert-type'=>'success',"valor"=>"0"];
                return $data;
               // return redirect()->back()->with(['message'=>"Modificado con exito!", 'alert-type'=>'success']);
            }
            elseif ($request->tabla=='consideraciones') {
                $consulta=DB::table('consideraciones')->where('datos_id',$request->idDatos)->where('user_id',$request->idUsuario)->where('beca_id',$request->idBeca)->where('id',$request->idCon)->update([$request->nombre=>$request->valor]);
                $data=['message'=>"Modificado con exito!", 'alert-type'=>'success',"valor"=>"0"];
                return $data;
            }
            }
            catch(Exception $e){
                $data=['message'=>"No se pudo modificar!", 'alert-type'=>'warning',"valor"=>"1"];
                  return $data;

            }
        }



    public function dar_baja_inscripcion(Request $request, $beca, $user_id){
       try{
        //user_id = id de datos persona
        $inscrip=DB::table('inscripciones')->where('datos_id',$user_id)->where('beca_id',$beca)->delete();
        $datos=DB::table('datos_personas')->where('id',$user_id)->where('beca_id',$beca)->delete();
        $fam=DB::table('familiars')->where('datos_id',$user_id)->where('beca_id',$beca)->delete();
        $con=DB::table('consideraciones')->where('datos_id',$user_id)->where('beca_id',$beca)->delete();

       return redirect()->back()->with(['message'=>"Borrado con exito!", 'alert-type'=>'warning'])  ;
        }catch (Exception $e) {
            return redirect('administracion/inscripciones')->with('message','Error en la accion con el usuario');
        }

    }   

    public function dar_baja(Request $request){
        //id de datos_persona
        DB::beginTransaction();
        try{
        $inscrip=DB::table('inscripciones')->where('datos_id',$request->id)->where('beca_id',$request->beca_id)->delete();
        $datos=DB::table('datos_personas')->where('id',$request->id)->where('beca_id',$request->beca_id)->delete();
        $fam=DB::table('familiars')->where('datos_id',$request->id)->where('beca_id',$request->beca_id)->delete();
        $con=DB::table('consideraciones')->where('datos_id',$request->id)->where('beca_id',$request->beca_id)->delete();

        DB::commit();
       return redirect('administracion/inscripciones/seleccion')->with(['message'=>"Borrado con exito!", 'alert-type'=>'warning'])  ;
        }catch (Exception $e) {
            DB::rollback();
                return redirect('administracion/inscripciones')->with('message','Error en la accion con el usuario');
            }
     }   



public function merito(Request $request, $datos_id,$beca_id){}

    public function calculo_merito(Request $request){
       if( (Auth::user()->role_id == '3') or (Auth::user()->role_id == '1')){
        
        $datos=DB::table('datos_personas')->where('id',$request->datos_id)->first();
        $fam=DB::table('familiars')->where('datos_id',$request->datos_id)->get();
        $con=DB::table('consideraciones')->where('datos_id',$request->datos_id)->get();
        $beca=DB::table('becas')->where('id',$request->beca_id)->first();
        $carrera= DB::table('carreras')->where('id',$datos->carrera_id)->first();
        $calculos_aux=DB::table('calculos_aux')->join('becas','calculos_aux.id','becas.id_calculos_auxiliares')->where('becas.id',$beca->id)->first();
                DB::beginTransaction();

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

                //Sumatoria de todos los transportes (pasajes*cant de viajes)
                $transporte=($datos->cant_viajes*$calculos_aux->precio_urbano)+($datos->precio_pasaje*$datos->cant_viaja_media)+($datos->cant_viaja_larga*$datos->precio_pasaje_larga);

                ///Sumatoria de los ingresos - gastos / la cantidad de gente
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

            if($datos->disca_estudiante == 1){      //estudiante tiene discapacidad
                $aux_pto_enfermedad = 10;
            }else{
                $aux_pto_enfermedad=0;
            }


            foreach ($con as $id => $obj) {
                if ($obj->incapacidad == 1) { //familiar(consideraciones) tiene discapacidad
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
                //  1 ingresante, 2 renovante, 3 nuevo, 4 condicional
            if($datos->condicion_estudiante_id==1){
                if($datos->promedio<=6){         
                    $promedio_secundaria=0;
                }else{
                    $promedio_secundaria=($datos->promedio*30/10);
                }
            }

                
                if($datos->condicion_estudiante_id==2 or $datos->condicion_estudiante_id==3)
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


              $inscripto=DB::table('inscripciones')->where('datos_id',$request->datos_id)
              ->update([
            'pto_procedencia' => $aux_pto_procedencia,
            'pto_ingresos' => $aux_pto_ingresos,
            'pto_enfermedad' => $aux_pto_enfermedad,
            'pto_academica' => $aux_pto_academica,
            'merito' => $aux_merito,
            'observacion' => 'Por calculo de Merito'
                ]);

             $data=['message'=>"Merito calculado con exito!", 'alert-type'=>'warning'];
 //           return redirect()->back()->with(['message'=>"Merito calculado con exito!", 'alert-type'=>'warning']);
              DB::commit();
              return $data;
    }

        catch (\Exception $e){
            DB::rollback();
            abort(404);

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
    $dt="Entre Rios ".$dt->format('d/m/Y - H:i')." hs";

    $inscrip=DB::table('inscripciones')
    ->join('datos_personas','inscripciones.datos_id','=','datos_personas.id')
    ->where('inscripciones.beca_id','=',$request->beca_id)
    ->where('inscripciones.user_id',$request->user_id)
    ->where('inscripciones.datos_id',$request->datos_id)
    ->join('users','datos_personas.user_id','users.id')
    ->join('becas','inscripciones.beca_id','becas.id') 
    ->select('inscripciones.id','users.name as user_nombre','users.apellido as user_apellido','becas.nombre as beca_nombre','inscripciones.created_at')
    ->first();


    $pdf = PDF::loadView('vendor.voyager.inscripciones.Comprobante_inscripcion',['inscrip'=>$inscrip,'dt'=>$dt/*, 'user'=>$user*/]);
   
        return $pdf->download('Comprobante Inscripcion.pdf');


        }else
        {
            return view('errors.404');

        }
     
    }
    
public function restablecer(Request $request, $datos_id,$beca_id){}

     public function restablecer_merito(Request $request){
        if( (Auth::user()->role_id == '3') or (Auth::user()->role_id == '1')){
            try{
              //  dd($request->all());
                $inscrip=DB::table('inscripciones')->where('datos_id',$request->datos_id)->where('beca_id',$request->beca_id)->update([
                        'merito'=>0,
                        'pto_procedencia'=>0,
                        'pto_ingresos'=>0,
                        'pto_enfermedad'=>0,
                        'pto_academica'=>0,
                        'observacion'=>"Restablecido",
                        'otorgamiento'=>2
                        //cambiar a 1 0 2
                        ]);
                $datos=DB::table('datos_personas')->where('id',$request->datos_id)->update([
                    'revision'=>0,
                    'band'=>0
                    ]);
                 $data=['message'=>"Restablecimiento con exito!", 'alert-type'=>'warning'];
                //return redirect()->back()->with(['message'=>"Restablecimiento con exito!", 'alert-type'=>'warning']);
                return $data;
            }
            catch (\Exception $e){
                abort(404);
            }
        }
        else
        {
            $data=['message'=>"Error", 'alert-type'=>'error'];
            return $data; 
          }
    }


    public function verificar(Request $request)
    {   //estado = id de beca - x=creacion sin id

        if($request->estado==''){
            $beca=DB::table('becas')->where('habilitada',1)->count();    
            if ($beca>=1){
            return response (['message'=>"Ya se posee una beca habilitada",'valor'=>'0']);
        }else{
            return response (['message'=>"Estas por habilitar la beca",'valor'=>'1']);
        }   
        }
        else{
            $beca=DB::table('becas')->where('id','<>',$request->estado)->where('habilitada',1)->count();
            //dd($beca);
            if ($beca>=1){
                return response (['message'=>"Ya se posee una beca habilitada",'valor'=>'0']);
            }else{
                return response (['message'=>"Estas por habilitar la beca",'valor'=>'1']);
            }
        }
    }




    }


    