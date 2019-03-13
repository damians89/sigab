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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Inicial con el formulario
////////////////////////////////////////////////////////////////////////////////////////////////////



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

//Para ver la localidad json desde el formulario de inscripcion
Route::get('datospersona/localidad/{id}', 'DatosPersonaController@getLocalidades');
//Localidades desde el panel del inscripto
Route::get('administracion/inscripciones/seleccion/localidad/{id}', 'InscripcionesController@getLocalidades')->name('localidad_datos');

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////Para proceasar inscripciones
//Seleccion de beca
Route::post('administracion/inscripciones/seleccion', 'InscripcionesController@seleccion')->name('seleccion');

//VER LOS DATOS INSCRIPTS -  ajax
Route::post('administracion/inscripciones/seleccion/datos','InscripcionesController@datos_usuario2')->name('datos_usuario2');


//para carga postulante y sus valores de revision,(Acepta o mno los datos)
Route::post('administracion/inscripciones/seleccion/datos/carga', 'InscripcionesController@carga')->name('carga');


//Calculo merito por ajax
Route::post('/administracion/inscripciones/seleccion/datos/merito', 'InscripcionesController@calculo_merito')->name('calculo_merito');

// Baja postulante desde el panel del inscripto
Route::DELETE('/administracion/inscripciones/seleccion/datos/dar_baja','InscripcionesController@dar_baja')->name('dar_baja');


//borrar datos de inscripcion (ptaje merito y estados)
Route::post('/administracion/inscripciones/seleccion/datos/restablecer', 'InscripcionesController@restablecer_merito')->name('restablecer_merito');




 
//panel de observacion:  ve la observacion
Route::post('administracion/inscripciones/seleccion/modificar_datos', 'InscripcionesController@modificar_datos' )->name('modificar_datos'); 

//panel de observacion: guarda los nuevos cambios
Route::post('administracion/inscripciones/seleccion/guarda_observacion', 'InscripcionesController@guarda_observacion' )->name('guarda_observacion'); 




//para revision ---- y este?

//Route::post('administracion/inscripciones/usuarios/datos_usuario', 'DatosPersonaController@revision')->name('rev');








// Baja postulante desde el panel de todos los inscriptos
Route::get('/dar_baja_inscripcion/{beca}/{user_id}','InscripcionesController@dar_baja_inscripcion')->name('dar_baja_inscripcion');


//para otorgar becas en el listado
Route::post('administracion/inscripciones/seleccion/otorgadas', 'InscripcionesController@otorgar')->name('otorgar');


//Creacion de pdf segun beca
Route::get('/administracion/pdf/{beca_id}','InscripcionesController@generarPdf')->name('generate-pdf');


//Lectura de archivos
Route::get('storage/{filename}', 'InscripcionesController@getFile')->where('filename', '^[^/]+$');



//update de cada uno de los datos del usuario(uno a uno los dato), lo que ve el secretario
Route::post('update', 'InscripcionesController@update')->name('update'); 

//para otorgar becas en el listado
Route::post('administracion/inscripciones/seleccion/otorgadas', 'InscripcionesController@otorgar')->name('otorgar');


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////// Lo que ve el estudiante
//Comprobante de inscripcion del usuario
Route::POST('/administracion/comprobante','InscripcionesController@comprobante_beca')->name('comprobante');


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////Carga de beca///
//Verificar si eesta habilitada la beca ajax
Route::post('verificar', 'InscripcionesController@verificar')->name('verificar'); 



////////// Backup routes
Route::get('/administracion/backup', 'BackupController@index');
Route::get('/administracion/backup/create/{id}', 'BackupController@create');
Route::get('/administracion/backup/download/{file_name}', ['as'=>'backDownload', 'uses'=>'BackupController@download']);
Route::get('/administracion/backup/delete/{file_name}', 'BackupController@delete');
