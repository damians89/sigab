<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('home');
});

//Routas de voyager y Login sobre escrito al de voyager
Route::group(['prefix' => 'administracion'], function () {
    Voyager::routes();
Route::get('login', ['uses'=>'Auth\LoginController@showLoginForm', 'as' => 'voyager.login']);

});

Route::get('/home', 'HomeController@index')->name('home');

/*Esto es el restfull de datos sacando los inecesario*/ 
Route::resource('datospersona', 'DatosPersonaController')->except(['edit','show','update','destroy']);

Auth::routes();

Route::get('datospersona/carrera/{id}', 'DatosPersonaController@getCarreras');


//Rutas para no logeados
Route::get('contacto', function () {
    return view('contacto');
});
Route::get('requisitos', function () {
    return view('requisitos');
});

Route::get('acerca', function () {
    return view('acerca');
});

//Para ver la localidad json
Route::get('datospersona/localidad/{id}', 'DatosPersonaController@getLocalidades');

Route::post('administracion/inscripciones/seleccion', 'InscripcionesController@seleccion')->name('seleccion'); //seleccion de beca


//VER LOS DATOS INSCRIPTS, dps de seleccion
Route::get('administracion/inscripciones/seleccion/usuario/datos_usuario/{beca_id}/{user_id}', 'InscripcionesController@datos_usuario')->name('datos_usuario'); 
 

//ve la obs
Route::get('administracion/inscripciones/seleccion/{user_id}/obsevacion', 'InscripcionesController@observacion' )->name('observacion'); 

//Calculo merito  (ADREDE el cambio de user:id a id)
Route::get('/administracion/inscripciones/seleccion/usuario/datos_usuario/{datos_id}/{beca_id}/merito', 'InscripcionesController@merito')->name('merito');

//borrar datos de inscripcion (ptaje merito y estados)
Route::get('/administracion/inscripciones/seleccion/usuario/datos_usuario/{datos_id}/{beca_id}/restablecer', 'InscripcionesController@restablecer')->name('restablecer');

//ve la obs
Route::post('administracion/inscripciones/seleccion/guarda_observacion', 'InscripcionesController@guarda_observacion' )->name('guarda_observacion'); 





//para revision ---- y este?
Route::post('administracion/inscripciones/usuarios/datos_usuario', 'DatosPersonaController@revision')->name('rev');


//para carga postulante y sus valores de revision,(Acepta o mno los datos)
Route::post('administracion/inscripciones/seleccion/carga', 'InscripcionesController@carga')->name('carga');


// Baja postulante desde el panel del inscripto
Route::DELETE('/dar_baja','InscripcionesController@dar_baja')->name('dar_baja');




// Baja postulante desde el panel de todos los inscriptos
Route::get('/dar_baja_inscripcion/{beca}/{user_id}','InscripcionesController@dar_baja_inscripcion')->name('dar_baja_inscripcion');


//para otorgar becas en el listado
Route::post('administracion/inscripciones/seleccion/otorgadas', 'InscripcionesController@otorgar')->name('otorgar');


//Creacion de pdf segun beca
Route::get('/administracion/pdf/{beca_id}','InscripcionesController@generarPdf')->name('generate-pdf');


//Lectura de archivos
Route::get('storage/{filename}', 'InscripcionesController@getFile')->where('filename', '^[^/]+$');


   // Backup routes
Route::get('/administracion/backup', 'BackupController@index');
Route::get('/administracion/backup/create/{id}', 'BackupController@create');
Route::get('/administracion/backup/download/{file_name}', ['as'=>'backDownload', 'uses'=>'BackupController@download']);
Route::get('/administracion/backup/delete/{file_name}', 'BackupController@delete');

//update de cada uno de los datos del usuario(uno a uno los dato), lo que ve el secretario
Route::post('update', 'InscripcionesController@update')->name('update'); 

//Verificar si eesta habilitada la beca
Route::post('verificar', 'InscripcionesController@verificar')->name('verificar'); 

//comprobante de inscripcion del usuario
Route::POST('/administracion/comprobante','InscripcionesController@comprobante_beca')->name('comprobante');