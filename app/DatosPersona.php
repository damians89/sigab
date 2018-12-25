<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DatosPersona extends Model
{
    protected $primarykey = 'id';

    protected $filiable = ['user_id','apellido','nombre','dni','imagen_dni','cuil','estcivil','domi','ciudad','cp','provincia','nacionalidad','cel','email','face','carrera_cursa','anioingreso','trabaja','sueldo','beca','pasan','asig','otrosing','domicursa','casafam','alq','montoalq','urbano','cantviaja','mediadist','preciopasaje','cantviajamedia','parentesco0','apeynom0','dni0','imagen_dni0','edad0','ocu0','ingreso0','imagen_ingreso0','imagen_anses0','propietario','alquila','precioalquiler','prestada','otrosvivienda','campo','has','actividad','terreno','terrenocant','auto','autocant','moto','motocant','enfermedad0','incapacidad0','imagen_incapacidad0','motivos'];

    /* public function __construct() {
        $this->middleware('auth');
        $this->middleware('log', ['only' => ['store', 'update', 'destroy']]);
    }
	
     public function beca()
	{
		return $this->belongsTo(Beca::class);
	}*/

    public function user(){
        return $this->belongsTo('App\User');
    }

    public function user_id() {
        return $this->belongsTo('App\User', 'user_id', 'id');
    }

    public function user_name(){
        return $this->belongsTo('App\User','user_name', 'name');
    }

    public function revision(){
        return $this->belongsTo('App\DatosPersona','revision', 'rev');
    }
    

}


