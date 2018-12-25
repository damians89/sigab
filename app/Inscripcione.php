<?php
namespace App;
use DB;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Inscripcione extends Model
{
	    public function save(array $options = [])
    {
        // If no author has been assigned, assign the current user's id as the author of the post
        if (!$this->user_id  && Auth::user()) {
            $this->user_id = Auth::user()->id;
           $this->user_nombre = Auth::user()->name;
        }

         parent::save();

    }
    
    /************* Relacion  con las otras clases ... A revisar **************/
     public function user_id()
    {
        return $this->hasMany(User::class,'user_id','id');
    }



    public function dame_id(){
        return Auth::user()->id;
    }


    /////////////////////////////////////////////////////////////////////

    //////////PAra calcular el merito... se podria llamar a una funcion externa...///

    public function Inscribir($request, $id){
        //echo "HOLAAAAAAAAAA estamos en Inscripcione.php";
      //  dd($request,$id);
        $aux_beca =  DB::table('becas')->where('habilitada', "Si")->first(); //Si tiene mas becas habilitada  ardeee!
        //dd($aux_beca);
        $inscripto = new Inscripcione();
            


        try{

            $inscripto->user_id = $request->user_id;
            $inscripto->datos_id = $id;
            $inscripto->beca_id = $aux_beca->id;
            $inscripto->beca_nombre = $aux_beca->nombre;
            
            $inscripto->user_nombre = $request->nombre;
            $inscripto->user_apellido = $request->apellido;;
            $inscripto->user_dni = $request->dni;
            

           $aux_carrera = DB::table('carreras')->where('id',$request->carrera_cursa)->first();
            $inscripto->carrera_nombre = $aux_carrera->nombre;
            $aux_sede = DB::table('sedes')->where('id',$aux_carrera->id_sede)->first();
            $inscripto->sede_nombre = $aux_sede->nombre;
            $aux_facu = DB::table('facultades')->where('id',$aux_carrera->id_facultad)->first();
            $inscripto->facultad_nombre = $aux_facu->nombre; 

            $aux_universidad=DB::table('universidades')->first();
            $inscripto->univ_nombre = $aux_universidad->nombre;
            
            //hasta aca
            $inscripto->merito = 0;
            $inscripto->observacion = 'Alta inicial';
            $inscripto->save();
    }

        catch (\Exception $e){
           ///dd($e);

            abort(404);//return redirect()->route('datospersona.index')->with('msg', ' Algo salio mal prueba de nuevo.');

        }
        return redirect()->route('home')->with('info', 'Hemos recibido tu inscripcion');
    }





}