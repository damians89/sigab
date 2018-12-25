<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Localidad extends Model
{
    protected $table = 'localidades';

    protected $fillable = ['id', 'localidad'];
    

	public static function localidades($id)
	{
		return Localidad::where('id_privincia', '=', $id)->get();
	}
}
