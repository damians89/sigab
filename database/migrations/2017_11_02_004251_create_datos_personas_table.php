<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDatosPersonasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('datos_personas', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned();
            $table->foreign('user_id')->references('id')->on('users'); //oculto    
            $table->string('user_name');
            $table->foreign('user_name')->references('name')->on('users'); //oculto
            $table->string('carrera_id');
            $table->date('anio_ingreso');
            $table->date('anio_carrera');
            $table->tinyInteger('tiene_trabajo');
            $table->integer('sueldo_trabajo');
            $table->tinyInteger('tiene_beca');
            $table->tinyInteger('tiene_pasantia');
            $table->tinyInteger('tiene_progresar');
            $table->tinyInteger('tiene_asignacion');
            $table->text('otros_ingresos')->nullable();
            $table->string('domicilio_cursado');
            $table->tinyInteger('casa_familia');
            $table->tinyInteger('alquila');
            $table->integer('monto_alquier')->unsigned();
            $table->tinyInteger('usa_urbano');
            $table->integer('urbano_cant')->unsigned();
            $table->tinyInteger('usa_medaidistancia');
            $table->integer('mediadistancia_cant')->unsigned();
            $table->integer('mediadistancia_precio')->unsigned();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('datos_personas');
    }
}
