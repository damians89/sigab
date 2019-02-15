<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;	
use App\Provincia;
use App\Localidad;
use App\Http\Controllers\Controller;

class eliminarProvinciaController extends Controller
{
    public function index()
    {
    	$provincia = Provincia::pluck('provincia', 'id');
    	$provincia->all();	
    	return view('eliminarselects', compact('provincia'));
    }

    public function getLocalidades(Request $request, $id)
    {
    	if($request->ajax()){
    		$localidad = Localidad::localidades($id);
    		return response()->json($localidad);
    	}
    }
}
