@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
    #tablaCalculoAuxiliar{
      font-size: 14px;
      max-width: 100%;
      margin-top: 2%;
      margin-bottom: -1%;
    }


    #panelAuxiliar{
      margin-left: 25%;
      margin-top: 2%;
      width: 70%;
    }

    #panelPuntaje{
      margin-top: 2%;
      margin-left: -5%;

      max-width: 80%;
    }

    #tablaPuntajeMerito{
      font-size: 14px;
      margin-top: 1%;
      margin-bottom: 5%;
    }

  </style>

<script type="text/javascript">
              function conPonerReadOnly(campos,pos)
              {
                $("#"+campos+pos).attr("readonly", "readonly");
                $("#"+campos+pos).addClass("readOnly");
                var valor = $("#"+campos+pos).val();
                var nombre = $("#"+campos+pos).attr('name');
                var idCon = $("#consideracion"+pos).val();
                var idUsuario = $(user_id).val();
                var idBeca = $(beca_id).val();
                var tabla = "consideraciones"


                $.ajax({
                  type: "POST",
                  url: '/update',
                  dataType: 'JSON',
                  //contentType: 'application/x-www-form-urlencoded',
                  data:{"idBeca":idBeca,"idCon":idCon,"nombre":nombre,"valor":valor,"tabla":tabla,"idUsuario":idUsuario},
                  success: function(data){
                
          

                
                  }   
                });


              }


   function conQuitarReadOnly(campos,pos)
    {
        // Eliminamos el atributo de solo lectura
        $("#"+campos+pos).removeAttr("readonly");
        // Eliminamos la clase que hace que cambie el color
        $("#"+campos+pos).removeClass("readOnly");

    
    }
 
</script>





<script type="text/javascript">
              function famPonerReadOnly(campos,pos)
              {
                $("#"+campos+pos).attr("readonly", "readonly");
                $("#"+campos+pos).addClass("readOnly");
                var valor = $("#"+campos+pos).val();
                var nombre = $("#"+campos+pos).attr('name');
                var idFam = $("#familiar"+pos).val();
                var idUsuario = $(user_id).val();
                var idBeca = $(beca_id).val();
                var tabla = "familiar"


                $.ajax({
                  type: "POST",
                  url: '/update',
                  dataType: 'JSON',
                  //contentType: 'application/x-www-form-urlencoded',
                  data:{"idBeca":idBeca,"idFam":idFam,"nombre":nombre,"valor":valor,"tabla":tabla,"idUsuario":idUsuario},
                  success: function(data){
                     
          

                
                  }   
                });


              }


   function famQuitarReadOnly(campos,pos)
    {
        // Eliminamos el atributo de solo lectura
        $("#"+campos+pos).removeAttr("readonly");
        // Eliminamos la clase que hace que cambie el color
        $("#"+campos+pos).removeClass("readOnly");

    
    }
 
</script>


<script>
    function ponerReadOnly(id)
    {
        // Ponemos el atributo de solo lectura
        $("#"+id).attr("readonly","readonly");
        // Ponemos una clase para cambiar el color del texto y mostrar que
        // esta deshabilitado
        $("#"+id).addClass("readOnly");

          var idBeca = $(beca_id).val();
          var idUsuario = $(user_id).val();
         var nombre = $("#"+id).attr('name');
          var valor = $("#"+id).val();
          var tabla = "datos_personas"


       
          $.ajax({
            type: "POST",
            url: '/update',
            dataType: 'JSON',
            //contentType: 'application/x-www-form-urlencoded',
            data:{"idBeca":idBeca,"idUsuario":idUsuario,"nombre":nombre,"valor":valor,"tabla":tabla},
            success: function(data){
             
            }
            });


    }
      
     
    function quitarReadOnly(id)
    {
        // Eliminamos el atributo de solo lectura
        $("#"+id).removeAttr("readonly");
        // Eliminamos la clase que hace que cambie el color
        $("#"+id).removeClass("readOnly");

    
    }
 
    /**
     * Mostramos en un alert si esta el atributo de solo lectura activado
     */
    function estado(id)
    {
        if($("#"+id).attr("readonly"))
        {
            alert("Tiene el atributo de solo lectura");
        }else{
            alert("NO Tiene el atributo de solo lectura");
        }
    }
    </script>

@section('content')




 

<h1><p align="center">Panel administrativo de inscripciones</p></h1>
<h3>Bienvenido {{Auth::user()->name}} </h3>



<div class="form-group">

<input type="hidden" value="{{ $datos->id}}"  name="user_id" id="user_id" required>
<input type="hidden" value="{{ $datos->beca_id}}"  name="beca_id" id="beca_id" required>



<div class="rwd">
  <h2 align="center"><div class="p-3 mb-2 bg-primary text-white">Datos de {{$datos->user_name}} {{$datos->user_apellido}}</div></h2>
   
    <table class="rwd_auto table table-responsive table-bordered" width="100%" cellpadding="5" cellspacing="5" border="0" >
    <tr> 
    <td width="50%">
   <div  class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#datospersonales" aria-expanded="false" aria-controls="datospersonales">
           <div class="col-md-11">
             <h4 align="left" class="">Datos Personales</h4>         
          </div>
         <div class="col-md-1 pull-right" style="margin-top: 1%;">
              <span class="glyphicon glyphicon-plus">Ver</span>
            </div>       
         </div>
   <div class="collapse" id="datospersonales">
  
  
    <table border="1" >  
      <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="26%">Modificar</td></th></tr>
      <tr>          
      <th width="20%">Nombre</th>
      <td>
      <input readonly value="{{ $datos->user_name}}" type="text"  class="form-control" name="user_name" id="idNombre" required>
      </td>
      <td></td>
      <td>
      <a onclick="quitarReadOnly('idNombre')" title="Editar" class="btn btn-sm btn-primary pull-left" name="user_name" style="display: inline;">
            <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm"></span>
        </a>
         <a onclick="ponerReadOnly('idNombre')" title="Guardar" class="btn btn-sm btn btn-success pull-right " style="display: inline;">
            <i class="voyager-check"></i> <span class="hidden-xs hidden-sm"></span>
        </a>
      </td> 
      </tr>


  <tr>
      <th width="20%">Apellido</th> 
      <td width="40%">
        <input readonly value="{{$datos->user_apellido}}" type="text" class="form-control" name="user_apellido" id="idApellido" required></td><td></td>
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idApellido')"  class="btn btn-sm btn-primary pull-left" name="user_apellido" title="Editar" value="Modificar">
          <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span>
        </a>
        <a style="display: inline;" onclick="ponerReadOnly('idApellido')" class="btn btn-sm btn-success pull-right" title="Guardar" value="Guardar">
          <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span>
        </a>
        
      </td>
      </tr>

      <tr>
      <th>DNI/CUIT</th>
      
      <td width="40%">
      <input readonly value="{{$datos->user_dni}}" type="text" class="form-control" name="user_dni" id="idDNI" required></td>
      <td>
      <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
        Imagen del DNI frente
            <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->imagen_dni_frente]) }}" alt="Imagen Dni frente" class="img-responsive lightbox hide">
        </a>
        <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
        Imagen del DNI Dorso
            <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->imagen_dni_dorso]) }}" alt="..." class="img-responsive lightbox hide">
        </a>
        </td>         
    <td>
        <a style="display: inline;" onclick="quitarReadOnly('idDNI')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span>
        </a>
        <a style="display: inline;" onclick="ponerReadOnly('idDNI')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span>
        </a>
        
      </td>
      </tr>

    <tr>
    <th>Estado civil</th>   
    
    <td width="40%">
    <select  readonly  class="form-control" name="estado_civil" id="idEstcivil" placeholder="Seleccione una opción" required>

                  
                  <option value="soltero" {{ ($datos->estado_civil) == 'soltero' ? 'selected' : '' }}>Soltero</option>
                  <option value="casado" {{ ($datos->estado_civil) == 'casado' ? 'selected' : '' }}>Casado</option>
                  <option value="divorciado" {{ ($datos->estado_civil) == 'divorciado' ? 'selected' : '' }}>Divorciado</option>
                  <option value="viudo" {{ ($datos->estado_civil) == 'viudo' ? 'selected' : '' }}>Viudo</option>
                </select>
                </td>

      <td>          
      </td>

      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idEstcivil')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span>
        </a>
        <a style="display: inline;" onclick="ponerReadOnly('idEstcivil')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
      </td>
    </tr>

    <tr>
    <th>Cumpleaños</th>
    
    <td width="40%">
    <input readonly value="{{$datos->cumple}}" type="date" class="form-control" name="cumple" id="idCumple" required></td>
    <td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idCumple')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span>
        </a>
        <a style="display: inline;" onclick="ponerReadOnly('idCumple')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span>
        </a>

      </td>
    </tr>
    
    <tr>
    <th>Domicilio</th>
    
    <td width="40%">
    <input readonly value="{{ $datos->domicilio}}" type="text" class="form-control" name="domicilio" id="idDomi" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idDomi')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idDomi')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>

    </tr>

    <th>Provincia</th>
    
    <td width="40%">
    <input readonly value="{{ $datos->provincia}}" type="text" class="form-control" name="provincia" id="idProvincia" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idProvincia')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idProvincia')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>

    </tr>

    <th>Código postal</th>
    
    <td width="40%">
    <input readonly value="{{ $datos->cp}}" type="text" class="form-control" name="cp" id="idCP" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idCP')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idCP')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>

    </tr>

    <th>Nacionalidad</th>
    
    <td width="40%">
    <input readonly value="{{ $datos->nacionalidad}}" type="text" class="form-control" name="nacionalidad" id="idNacionalidad" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idNacionalidad')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idNacionalidad')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>

    </tr>

    <tr>
    <th>Celular</th>
    
    <td width="40%"><input readonly value="{{ $datos->cel}}" type="text" class="form-control" name="cel" id="idCel" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idCel')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idCel')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
        
      </td>
    </tr>

    <tr>
    <th>Correo electrónico</th>
    
    <td width="40%"><input readonly value="{{ $datos->user_email }}" type="text" class="form-control" name="user_email" id="idEmail" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idEmail')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idEmail')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
        
      </td>
    </tr>

    <tr>
      <th>Facebook</th>
      
      <td width="40%"><input readonly value="{{ $datos->face}}" type="text" class="form-control" name="face" id="idFace" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idFace')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idFace')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>
    </tr>

    <tr><th>Posee discapacidad</th>
      
      <td width="40%">


    <select  readonly  class="form-control" name="disca_estudiante" id="idDiscaest" placeholder="Seleccione una opción" required>

        <option value="Si" {{ ($datos->disca_estudiante) == 'Si' ? 'selected' : '' }}>Si</option>
        <option value="No" {{ ($datos->disca_estudiante) == 'No' ? 'selected' : '' }}>No</option>
        
      </select>
      
      
      </td>
      <td>
      <?php if ($datos->disca_estudiante == "Si"): ?>
      <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox">
            Certificado de discapacidad 
              <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->certificado_discapacidad]) }}" alt="..." class="img-responsive lightbox hide">
          </a></td>
           <?php endif; ?>
          <td>
        <a style="display: inline;" onclick="quitarReadOnly('idDiscaest')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idDiscaest')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>
      </tr>
<tr><th>Kilómetros procedencia</th>
      
      <td width="40%"><input readonly value="{{ $datos->km_procedencia}}" type="numeric" class="form-control" name="km_procedencia" id="idKm" required></td><td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idKm')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idKm')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td></tr>

</div>
    </table>
      </td>

  <td width="50%">
  
   <div  class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#datosacademicos" aria-expanded="false" aria-controls="datosacademicos">
           <div class="col-md-11">
             <h4 align="left" class="">Datos Académicos</h4>         
          </div>
         <div class="col-md-1 pull-right" style="margin-top: 1%;">
              <span class="glyphicon glyphicon-plus">Ver</span>
            </div>       
         </div>
   <div class="collapse" id="datosacademicos">
  
    <table border="1">    
        <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="21%">Modificar</td></th></tr>
      
      <tr>
        
        <th>Condición estudiante</th>
        <td width="40%">
          

          <select readonly class="form-control" name="condicion_estudiante" id="IdCond" placeholder="Seleccione una opción" required>
            @foreach($condicion as $condiciones)
            <option 
            value= {{$condiciones->nombre}} {{ ($datos->condicion_estudiante) == $condiciones->nombre ? 'selected' : '' }}>{{ $condiciones->nombre }}
            </option>
            @endforeach
            </select>
        </td>


        
        <td>
        <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox">
           Certificado de Estudiante 
            <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->certificado_estudiante]) }}" alt="..." class="img-responsive lightbox hide">
          </a>
          <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox">
          Constancia de Estudiante 
            <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->constancia_estudiante]) }}" alt="..." class="img-responsive lightbox hide">
          </a>
        </td>
        
        <td>
        <a style="display: inline;" onclick="quitarReadOnly('IdCond')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('IdCond')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>
       </tr>

       <tr>
        <th>Carrera que cursa</th>
        <td>{{ $datos->carrera_cursa}} 
        </td><td></td>
        <td>
        <a style="display: inline;" onclick="quitarReadOnly('IdCond')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('IdCond')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
      </td>
       </tr>


      <tr>
      <th>Año de ingreso</th>
        <td>
        <select readonly  class="form-control" name="anio_ingreso" id="IdAnioingreso"  required>
                    <option value="2000" {{ ($datos->anio_ingreso) == '2000' ? 'selected' : '' }}>2000</option>
                    <option value="2001" {{ ($datos->anio_ingreso) == '2001' ? 'selected' : '' }}>2001</option>
                    <option value="2002" {{ ($datos->anio_ingreso) == '2002' ? 'selected' : '' }}>2002</option>
                    <option value="2003" {{ ($datos->anio_ingreso) == '2003' ? 'selected' : '' }}>2003</option>
                    <option value="2004" {{ ($datos->anio_ingreso) == '2004' ? 'selected' : '' }}>2004</option>
                    <option value="2005" {{ ($datos->anio_ingreso) == '2005' ? 'selected' : '' }}>2005</option>
                    <option value="2006" {{ ($datos->anio_ingreso) == '2006' ? 'selected' : '' }}>2006</option>
                    <option value="2007" {{ ($datos->anio_ingreso) == '2007' ? 'selected' : '' }}>2007</option>
                    <option value="2008" {{ ($datos->anio_ingreso) == '2008' ? 'selected' : '' }}>2008</option>
                    <option value="2009" {{ ($datos->anio_ingreso) == '2009' ? 'selected' : '' }}>2009</option>
                    <option value="2010" {{ ($datos->anio_ingreso) == '2010' ? 'selected' : '' }}>2010</option>
                    <option value="2011" {{ ($datos->anio_ingreso) == '2011' ? 'selected' : '' }}>2011</option>
                    <option value="2012" {{ ($datos->anio_ingreso) == '2012' ? 'selected' : '' }}>2012</option>
                    <option value="2013" {{ ($datos->anio_ingreso) == '2013' ? 'selected' : '' }}>2013</option>
                    <option value="2014" {{ ($datos->anio_ingreso) == '2014' ? 'selected' : '' }}>2014</option>
                    <option value="2015" {{ ($datos->anio_ingreso) == '2015' ? 'selected' : '' }}>2015</option>
                    <option value="2016" {{ ($datos->anio_ingreso) == '2016' ? 'selected' : '' }}>2016</option>
                    <option value="2017" {{ ($datos->anio_ingreso) == '2017' ? 'selected' : '' }}>2017</option>
                    <option value="2018" {{ ($datos->anio_ingreso) == '2018' ? 'selected' : '' }}>2018</option>
                    <option value="2019" {{ ($datos->anio_ingreso) == '2019' ? 'selected' : '' }}>2019</option>
                    <option value="2020" {{ ($datos->anio_ingreso) == '2020' ? 'selected' : '' }}>2020</option>
                    <option value="2021" {{ ($datos->anio_ingreso) == '2021' ? 'selected' : '' }}>2021</option>
                    <option value="2022" {{ ($datos->anio_ingreso) == '2022' ? 'selected' : '' }}>2022</option>
                    <option value="2023" {{ ($datos->anio_ingreso) == '2023' ? 'selected' : '' }}>2023</option>
                    <option value="2024" {{ ($datos->anio_ingreso) == '2024' ? 'selected' : '' }}>2024</option>
                    <option value="2025" {{ ($datos->anio_ingreso) == '2025' ? 'selected' : '' }}>2025</option>
                    <option value="2026" {{ ($datos->anio_ingreso) == '2026' ? 'selected' : '' }}>2026</option>
                    <option value="2027" {{ ($datos->anio_ingreso) == '2027' ? 'selected' : '' }}>2027</option>
                    <option value="2028" {{ ($datos->anio_ingreso) == '2028' ? 'selected' : '' }}>2028</option>
                    <option value="2029" {{ ($datos->anio_ingreso) == '2029' ? 'selected' : '' }}>2029</option>
                    <option value="2030" {{ ($datos->anio_ingreso) == '2030' ? 'selected' : '' }}>2030</option>
                    <option value="2031" {{ ($datos->anio_ingreso) == '2031' ? 'selected' : '' }}>2031</option>
                    <option value="2032" {{ ($datos->anio_ingreso) == '2032' ? 'selected' : '' }}>2032</option>
                    <option value="2033" {{ ($datos->anio_ingreso) == '2033' ? 'selected' : '' }}>2033</option>
                    <option value="2034" {{ ($datos->anio_ingreso) == '2034' ? 'selected' : '' }}>2034</option>
                    <option value="2035" {{ ($datos->anio_ingreso) == '2035' ? 'selected' : '' }}>2035</option>
                    <option value="2036" {{ ($datos->anio_ingreso) == '2036' ? 'selected' : '' }}>2036</option>
                    <option value="2037" {{ ($datos->anio_ingreso) == '2037' ? 'selected' : '' }}>2037</option>
                    <option value="2038" {{ ($datos->anio_ingreso) == '2038' ? 'selected' : '' }}>2038</option>
                    <option value="2039" {{ ($datos->anio_ingreso) == '2039' ? 'selected' : '' }}>2039</option>
                    <option value="2040" {{ ($datos->anio_ingreso) == '2040' ? 'selected' : '' }}>2040</option>
                    <option value="2041" {{ ($datos->anio_ingreso) == '2041' ? 'selected' : '' }}>2041</option>
                    <option value="2042" {{ ($datos->anio_ingreso) == '2042' ? 'selected' : '' }}>2042</option>
                    <option value="2043" {{ ($datos->anio_ingreso) == '2043' ? 'selected' : '' }}>2043</option>
                    <option value="2044" {{ ($datos->anio_ingreso) == '2044' ? 'selected' : '' }}>2044</option>
                    <option value="2045" {{ ($datos->anio_ingreso) == '2045' ? 'selected' : '' }}>2045</option>
                    <option value="2046" {{ ($datos->anio_ingreso) == '2046' ? 'selected' : '' }}>2046</option>
                    <option value="2047" {{ ($datos->anio_ingreso) == '2047' ? 'selected' : '' }}>2047</option>
                    <option value="2048" {{ ($datos->anio_ingreso) == '2048' ? 'selected' : '' }}>2048</option>
                    <option value="2049" {{ ($datos->anio_ingreso) == '2049' ? 'selected' : '' }}>2049</option>
                    <option value="2050" {{ ($datos->anio_ingreso) == '2050' ? 'selected' : '' }}>2050</option>

                </select>
        </td><td></td>
        <td>
          <a style="display: inline;" onclick="quitarReadOnly('IdAnioingreso')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
          <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
          <a style="display: inline;" onclick="ponerReadOnly('IdAnioingreso')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
          <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
        </td>
        </tr>
    
      <tr>
        <th>Año de cursado</th>
      
      <td width="40%"><input readonly value="{{ $datos->anio_cursado}}" type="numeric" class="form-control" name="anio_cursado" id="idAnioCursado" required></td>
      <td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idAnioCursado')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idAnioCursado')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>
</tr>

    <tr>
        <th>Materias aprobadas</th>
      
      <td width="40%"><input readonly value="{{ $datos->cant_materia}}" type="numeric" class="form-control" name="cant_materia" id="idCantMateria" required></td>
      <td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idCantMateria')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idCantMateria')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>
</tr>
<tr>
        <th>Promedio</th>
      
      <td width="40%"><input readonly value="{{ $datos->promedio}}" type="numeric" class="form-control" name="promedio" id="idPromedio" required></td>
      <td></td>
      
      <td>
        <a style="display: inline;" onclick="quitarReadOnly('idPromedio')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
        <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
        <a style="display: inline;" onclick="ponerReadOnly('idPromedio')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
        <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            
      </td>

</tr>


      </table>
      </div>
  </td>
  </tr>
  </table>


  <table class="rwd_auto table table-responsive table-bordered" width="100%" cellpadding="5" cellspacing="5" border="0">
    <tr>
      <td width="50%">
    
     <div  class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#datoseconomicos" aria-expanded="false" aria-controls="datoseconomicos">
           <div class="col-md-11">
             <h4 align="left" class="">Datos Económicos</h4>         
          </div>
         <div class="col-md-1 pull-right" style="margin-top: 1%;">
              <span class="glyphicon glyphicon-plus">Ver</span>
            </div>       
         </div>
   <div class="collapse" id="datoseconomicos">
  
      <table border="1">  
          <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="23%">Modificar</td></th></tr>

          <tr>
            <th>Posee trabajo</th>
            <td>
              <select readonly  class="form-control" name="tiene_trabajo" id="Idtrabaja" required>
                    
                    <option value="Si" {{ ($datos->tiene_trabajo) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->tiene_trabajo) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td>
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('Idtrabaja')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('Idtrabaja')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Tipo trabajo</th>
            <td>
              <select readonly class="form-control" name="tipo_trabajo" id="IdActlab"  required>
                      <option value="activos" {{ ($datos->tipo_trabajo) == 'activos' ? 'selected' : '' }}>Empleados Activos o Jubilados</option>
                      <option value="monotri" {{ ($datos->tipo_trabajo) == 'monotri' ? 'selected' : '' }}>Autónomos y Monotributistas</option>
                      <option value="informal" {{ ($datos->tipo_trabajo) == 'informal' ? 'selected' : '' }}>Trabajadores Informales</option>
                </select>
            </td>
            <td>  
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('IdActlab')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('IdActlab')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Sueldo</th>
            <td width="40%"><input readonly value="{{$datos->sueldo}}" type="text" class="form-control" name="sueldo" id="idSueldo" required></td><td>
               <?php if ($datos->disca_estudiante == "Si"): ?>
              <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
              Comprobante de ingresos
               <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->comprobante_ingresos_1]) }}" alt="..." class="img-responsive lightbox hide">
              </a>
            </td>
            <?php endif; ?>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idSueldo')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idSueldo')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          

          <tr>
            <th>Otra Beca</th>
            <td>
              <select readonly  class="form-control" name="tiene_beca" id="IdBeca" required>
                    
                    <option value="1" {{ ($datos->tiene_beca) == '1' ? 'selected' : '' }}>Si</option>
                    <option value="2" {{ ($datos->tiene_beca) == '2' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td>
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('IdBeca')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('IdBeca')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>PROGRESAR</th>
            
            <td>
              <select readonly  class="form-control" name="tiene_progresar" id="IdProgresar" required>
                    
                    <option value="1" {{ ($datos->tiene_progresar) == '1' ? 'selected' : '' }}>Si</option>
                    <option value="2" {{ ($datos->tiene_progresar) == '2' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td>
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('IdProgresar')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('IdProgresar')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Pasantía</th>
            
            <td>
              <select readonly  class="form-control" name="tiene_pasantia" id="idPasan" required>
                    
                    <option value="1" {{ ($datos->tiene_pasantia) == '1' ? 'selected' : '' }}>Si</option>
                    <option value="2" {{ ($datos->tiene_pasantia) == '2' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td>
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idPasan')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idPasan')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>


          <tr>
            <th>Asignación Universal por Hijo</th>
            
            <td>
              <select readonly  class="form-control" name="tiene_asig" id="idAsig" required>
                    
                    <option value="1" {{ ($datos->tiene_asig) == '1' ? 'selected' : '' }}>Si</option>
                    <option value="2" {{ ($datos->tiene_asig) == '2' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td>
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idAsig')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idAsig')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>


          <tr>
            <th>Otros Ingresos</th>
            <td>
              <input readonly value="{{ $datos->otros_ing }}" type="text-area" class="form-control" name="otros_ing" id="idOtrosing">
            </td><td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idOtrosing')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idOtrosing')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>



@if($datos->otros_ing=="Si")

          <tr>
            <th>Otros ingresos cantidad</th>
            <td>
              <input readonly value="{{ $datos->otros_ing_cant }}" type="text-area" class="form-control" name="otros_ing_cant" id="idOtrosingcant">
            </td><td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idOtrosingcant')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idOtrosingcant')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Otros ingresos descripción</th>
            <td>
              <input readonly value="{{ $datos->otros_ing_descr }}" type="text-area" class="form-control" name="otros_ing_descr" id="idOtrosingdescr">
            </td><td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idOtrosingdescr')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idOtrosingdescr')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>
@endif


        

</div>

      </table>
      </td>

  <td width="50%">
  
  <div  class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#datosdevivienda" aria-expanded="false" aria-controls="datosdevivienda">
           <div class="col-md-11">
             <h4 align="left" class="">Datos de Vivienda</h4>         
          </div>
         <div class="col-md-1 pull-right" style="margin-top: 1%;">
              <span class="glyphicon glyphicon-plus">Ver</span>
            </div>       
         </div>
   <div class="collapse" id="datosdevivienda"> 
  <shadow></shadow>
    <table border="1">    
        <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="21%">Modificar</td></th></tr>


          <tr>

            <th>Domicilio durante cursado</th>
            
            <td>
              <input readonly value="{{ $datos->domi_cursado }}" type="text-area" class="form-control" name="domi_cursado" id="idDomicursa">
            </td><td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idDomicursa')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idDomicursa')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>


          <tr>
            <th>Vive con la familia</th>
            <td>
            <select readonly class="form-control" name="casa_fam" id="idCasafam" required>
                    <option value="Si" {{ ($datos->casa_fam) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->casa_fam) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
                <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idCasafam')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idCasafam')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>
          

  
          <tr>
            <th>Alquila</th>
            
              <td>
            <select readonly class="form-control" name="tiene_alq" id="idAlq" required>
                    <option value="Si" {{ ($datos->tiene_alq) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->tiene_alq) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
                <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idAlq')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idAlq')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
              
          </tr>

            <tr>
            <th>Monto</th>
            
            <td>
              <input readonly value="{{ $datos->monto_alq }}" type="text-area" class="form-control" name="monto_alq" id="idMontoalq">            
            </td>
            <td>
            <?php if ($datos->tiene_alq == "Si"): ?>
        
              <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
              Recibo Alquiler
               <img src="{{ action('InscripcionesController@getFile',['filename' =>$datos->recibo_alquiler]) }}" alt="..." class="img-responsive lightbox hide">
              </a>
            </td>
              <?php endif; ?>
        
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idMontoalq')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idMontoalq')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
              
          </tr>
    </table>
    </div>
  </td>
  </tr>
  </table>

<table class="rwd_auto table table-responsive table-bordered" width="100%" cellpadding="5" cellspacing="5" border="0">
    <tr>
      <td width="50%">
    
     <div  class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#viajaparacursar" aria-expanded="false" aria-controls="viajaparacursar">
         <div class="col-md-11">
           <h4 align="left" class="">Viaja para cursar</h4>         
        </div>
       <div class="col-md-1 pull-right" style="margin-top: 1%;">
            <span class="glyphicon glyphicon-plus">Ver</span>
          </div>       
       </div>
 <div class="collapse" id="viajaparacursar"> 
  
      <table border="1">  
          <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="21%">Modificar</td></th></tr>

          <tr>
            <th>Usa colectivo urbano</th>
            <td> 
               <select readonly class="form-control" name="usa_urbano" id="idUrbano"  required>
                    <option value="Si" {{ ($datos->usa_urbano) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->usa_urbano) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idUrbano')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idUrbano')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>
<?php if ($datos->usa_urbano == "Si"): ?>
          <tr>

            <th> Cantidad de viajes</th>
            <td> 
            <select readonly class="form-control" name="cant_viajes" id="idCantviaja" required>
                    
                    <option value="0" {{ ($datos->cant_viajes) == '0' ? 'selected' : '' }}>0</option>
                    <option value="1"  {{ ($datos->cant_viajes) == '1' ? 'selected' : '' }}>1</option>
                    <option value="2"  {{ ($datos->cant_viajes) == '2' ? 'selected' : '' }}>2</option>
                    <option value="3"  {{ ($datos->cant_viajes) == '3' ? 'selected' : '' }}>3</option>
                    <option value="4"  {{ ($datos->cant_viajes) == '4' ? 'selected' : '' }}>4</option>
                    <option value="5"  {{ ($datos->cant_viajes) == '5' ? 'selected' : '' }}>5</option>
                    <option value="6"  {{ ($datos->cant_viajes) == '6' ? 'selected' : '' }}>6</option>
                    <option value="7"  {{ ($datos->cant_viajes) == '7' ? 'selected' : '' }}>7</option>
                    <option value="8"  {{ ($datos->cant_viajes) == '8' ? 'selected' : '' }}>8</option>
                    <option value="9"  {{ ($datos->cant_viajes) == '9' ? 'selected' : '' }}>9</option>
                    <option value="10" {{ ($datos->cant_viajes) == '10' ? 'selected' : '' }}>10</option>
                    <option value="11" {{ ($datos->cant_viajes) == '11' ? 'selected' : '' }}>11</option>
                    <option value="12" {{ ($datos->cant_viajes) == '12' ? 'selected' : '' }}>12</option>
                    <option value="13" {{ ($datos->cant_viajes) == '13' ? 'selected' : '' }}>13</option>
                    <option value="14" {{ ($datos->cant_viajes) == '14' ? 'selected' : '' }}>14</option>
                    <option value="15" {{ ($datos->cant_viajes) == '15' ? 'selected' : '' }}>15</option>
                    <option value="16" {{ ($datos->cant_viajes) == '16' ? 'selected' : '' }}>16</option>
                    <option value="17" {{ ($datos->cant_viajes) == '17' ? 'selected' : '' }}>17</option>
                    <option value="18" {{ ($datos->cant_viajes) == '18' ? 'selected' : '' }}>18</option>
                    <option value="19" {{ ($datos->cant_viajes) == '19' ? 'selected' : '' }}>19</option>
                    <option value="20" {{ ($datos->cant_viajes) == '20' ? 'selected' : '' }}>20</option>
                    <option value="21" {{ ($datos->cant_viajes) == '21' ? 'selected' : '' }}>21</option>
                    <option value="22" {{ ($datos->cant_viajes) == '22' ? 'selected' : '' }}>22</option>
                    <option value="23" {{ ($datos->cant_viajes) == '23' ? 'selected' : '' }}>23</option>
                    <option value="24" {{ ($datos->cant_viajes) == '24' ? 'selected' : '' }}>24</option>
                    <option value="25" {{ ($datos->cant_viajes) == '25' ? 'selected' : '' }}>25</option>
                    <option value="26" {{ ($datos->cant_viajes) == '26' ? 'selected' : '' }}>26</option>
                    <option value="27" {{ ($datos->cant_viajes) == '27' ? 'selected' : '' }}>27</option>
                    <option value="28" {{ ($datos->cant_viajes) == '28' ? 'selected' : '' }}>28</option>
                    <option value="29" {{ ($datos->cant_viajes) == '29' ? 'selected' : '' }}>29</option>
                    <option value="30" {{ ($datos->cant_viajes) == '30' ? 'selected' : '' }}>30</option>
                    <option value="31" {{ ($datos->cant_viajes) == '31' ? 'selected' : '' }}>31</option>
                    <option value="32" {{ ($datos->cant_viajes) == '32' ? 'selected' : '' }}>32</option>
                    <option value="33" {{ ($datos->cant_viajes) == '33' ? 'selected' : '' }}>33</option>
                    <option value="34" {{ ($datos->cant_viajes) == '34' ? 'selected' : '' }}>34</option>
                    <option value="35" {{ ($datos->cant_viajes) == '35' ? 'selected' : '' }}>35</option>
                    <option value="36" {{ ($datos->cant_viajes) == '36' ? 'selected' : '' }}>36</option>
                    <option value="37" {{ ($datos->cant_viajes) == '37' ? 'selected' : '' }}>37</option>
                    <option value="38" {{ ($datos->cant_viajes) == '38' ? 'selected' : '' }}>38</option>
                    <option value="39" {{ ($datos->cant_viajes) == '39' ? 'selected' : '' }}>39</option>
                    <option value="40" {{ ($datos->cant_viajes) == '40' ? 'selected' : '' }}>40</option>
                    <option value="41" {{ ($datos->cant_viajes) == '41' ? 'selected' : '' }}>41</option>
                    <option value="42" {{ ($datos->cant_viajes) == '42' ? 'selected' : '' }}>42</option>
                    <option value="43" {{ ($datos->cant_viajes) == '43' ? 'selected' : '' }}>43</option>
                    <option value="44" {{ ($datos->cant_viajes) == '44' ? 'selected' : '' }}>44</option>
                    <option value="45" {{ ($datos->cant_viajes) == '45' ? 'selected' : '' }}>45</option>
                    <option value="46" {{ ($datos->cant_viajes) == '46' ? 'selected' : '' }}>46</option>
                    <option value="47" {{ ($datos->cant_viajes) == '47' ? 'selected' : '' }}>47</option>
                    <option value="48" {{ ($datos->cant_viajes) == '48' ? 'selected' : '' }}>48</option>
                    <option value="49" {{ ($datos->cant_viajes) == '49' ? 'selected' : '' }}>49</option>
                    <option value="50" {{ ($datos->cant_viajes) == '50' ? 'selected' : '' }}>50</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idCantviaja')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idCantviaja')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>
    <?php endif; ?>
        
          <tr>
            <th>Media distancia</th>
              
              <td> 
               <select readonly class="form-control" name="usa_media_dist" id="idMediadist"  required>
                    <option value="Si" {{ ($datos->usa_media_dist) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->usa_media_dist) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td>  
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idMediadist')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idMediadist')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

            <?php if ($datos->usa_media_dist == "Si"): ?>
          <tr>
            <th>Cantidad de viajes</th>
            
            <td> 
               <select readonly class="form-control" name="cant_viaja_media" id="idCantviajamedia" required>
                    
                    <option value="0" {{ ($datos->cant_viaja_media) == '0' ? 'selected' : '' }}>0</option>
                    <option value="1"  {{ ($datos->cant_viaja_media) == '1' ? 'selected' : '' }}>1</option>
                    <option value="2"  {{ ($datos->cant_viaja_media) == '2' ? 'selected' : '' }}>2</option>
                    <option value="3"  {{ ($datos->cant_viaja_media) == '3' ? 'selected' : '' }}>3</option>
                    <option value="4"  {{ ($datos->cant_viaja_media) == '4' ? 'selected' : '' }}>4</option>
                    <option value="5"  {{ ($datos->cant_viaja_media) == '5' ? 'selected' : '' }}>5</option>
                    <option value="6"  {{ ($datos->cant_viaja_media) == '6' ? 'selected' : '' }}>6</option>
                    <option value="7"  {{ ($datos->cant_viaja_media) == '7' ? 'selected' : '' }}>7</option>
                    <option value="8"  {{ ($datos->cant_viaja_media) == '8' ? 'selected' : '' }}>8</option>
                    <option value="9"  {{ ($datos->cant_viaja_media) == '9' ? 'selected' : '' }}>9</option>
                    <option value="10" {{ ($datos->cant_viaja_media) == '10' ? 'selected' : '' }}>10</option>
                    <option value="11" {{ ($datos->cant_viaja_media) == '11' ? 'selected' : '' }}>11</option>
                    <option value="12" {{ ($datos->cant_viaja_media) == '12' ? 'selected' : '' }}>12</option>
                    <option value="13" {{ ($datos->cant_viaja_media) == '13' ? 'selected' : '' }}>13</option>
                    <option value="14" {{ ($datos->cant_viaja_media) == '14' ? 'selected' : '' }}>14</option>
                    <option value="15" {{ ($datos->cant_viaja_media) == '15' ? 'selected' : '' }}>15</option>
                    <option value="16" {{ ($datos->cant_viaja_media) == '16' ? 'selected' : '' }}>16</option>
                    <option value="17" {{ ($datos->cant_viaja_media) == '17' ? 'selected' : '' }}>17</option>
                    <option value="18" {{ ($datos->cant_viaja_media) == '18' ? 'selected' : '' }}>18</option>
                    <option value="19" {{ ($datos->cant_viaja_media) == '19' ? 'selected' : '' }}>19</option>
                    <option value="20" {{ ($datos->cant_viaja_media) == '20' ? 'selected' : '' }}>20</option>
                    <option value="21" {{ ($datos->cant_viaja_media) == '21' ? 'selected' : '' }}>21</option>
                    <option value="22" {{ ($datos->cant_viaja_media) == '22' ? 'selected' : '' }}>22</option>
                    <option value="23" {{ ($datos->cant_viaja_media) == '23' ? 'selected' : '' }}>23</option>
                    <option value="24" {{ ($datos->cant_viaja_media) == '24' ? 'selected' : '' }}>24</option>
                    <option value="25" {{ ($datos->cant_viaja_media) == '25' ? 'selected' : '' }}>25</option>
                    <option value="26" {{ ($datos->cant_viaja_media) == '26' ? 'selected' : '' }}>26</option>
                    <option value="27" {{ ($datos->cant_viaja_media) == '27' ? 'selected' : '' }}>27</option>
                    <option value="28" {{ ($datos->cant_viaja_media) == '28' ? 'selected' : '' }}>28</option>
                    <option value="29" {{ ($datos->cant_viaja_media) == '29' ? 'selected' : '' }}>29</option>
                    <option value="30" {{ ($datos->cant_viaja_media) == '30' ? 'selected' : '' }}>30</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idCantviajamedia')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idCantviajamedia')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Precio pasaje</th>
            <td>
            <input readonly value="{{ $datos->precio_pasaje}}"  type="number" min="0" class="form-control" name="precio_pasaje" id="idPreciopasaje" required>
            </td>
            <td>
        
              <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
              Recibo pasaje
               <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->recibo_pasaje]) }}" alt="..." class="img-responsive lightbox hide">
              </a>
            </td>
                 <td>
              <a style="display: inline;" onclick="quitarReadOnly('idPreciopasaje')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idPreciopasaje')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>


                             <tr>
            <th>Cantidad de kilómetros media distancia</th>
            <td>
              <input readonly value="{{ $datos->cant_km}}"  type="text-area" class="form-control" name="cant_km" id="idCantKm" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idCantKm')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idCantKm')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>


              <?php endif; ?>

                                  <tr>
            <th>Larga distancia</th>
            <td>
              <select readonly class="form-control" name="larga_distancia" id="idLargaDistancia" required>
                <option value="Si" {{ ($datos->larga_distancia) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->larga_distancia) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idLargaDistancia')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idLargaDistancia')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>
        

            <?php if ($datos->larga_distancia == "Si"): ?>
         
                                  <tr>
            <th>Cantidad de viajes</th>
            <td>
              <input readonly value="{{ $datos->cant_viaja_larga}}"  type="text-area" class="form-control" name="cant_viaja_larga" id="idCantViajaLarga" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idCantViajaLarga')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idCantViajaLarga')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>
        




                                  <tr>
            <th>Cantidad de kilómetros larga distancia</th>
            <td>
              <input readonly value="{{ $datos->cant_km_larga}}"  type="text-area" class="form-control" name="cant_km_larga" id="idCantKmLarga" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idCantKmLarga')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idCantKmLarga')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr> 




                                  <tr>
            <th>Precio pasaje</th>
            <td>
              <input readonly value="{{ $datos->precio_pasaje_larga}}"  type="text-area" class="form-control" name="precio_pasaje_larga" id="idPrecioLarga" required>
            </td>
            <td>

              <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
              Recibo pasaje
               <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->recibo_pasaje_larga]) }}" alt="..." class="img-responsive lightbox hide">
              </a>
      

            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idPrecioLarga')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idPrecioLarga')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr> 






       <?php endif; ?>

      </table>
      </div>
      </td>

  <td width="50%">
 
     <div  class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#estadogrupofamiliar" aria-expanded="false" aria-controls="estadogrupofamiliar">
         <div class="col-md-11">
           <h4 align="left" class="">Estado patrimonial del grupo Familiar</h4>         
        </div>
       <div class="col-md-1 pull-right" style="margin-top: 1%;">
            <span class="glyphicon glyphicon-plus">Ver</span>
          </div>       
       </div>
 <div class="collapse" id="estadogrupofamiliar"> 

    <table border="1">    
        <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="21%">Modificar</td></th></tr>

        <tr>
            <th>Propietario</th>
            <td>
                <select readonly class="form-control" name="es_propietario" id="idPropietario" required>
                    <option value="1" {{ ($datos->es_propietario) == '1' ? 'selected' : '' }}>Si</option>
                    <option value="2" {{ ($datos->es_propietario) == '2' ? 'selected' : '' }}>No</option>
                </select>
             </td>   
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idPropietario')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idPropietario')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>

          </tr>


          <tr>
            <th>Alquila</th>
            <td>
              <select readonly class="form-control" name="alquila" id="idAlquila" required>
                    <option value="1" {{ ($datos->alquila) == '1' ? 'selected' : '' }}>Si</option>
                    <option value="2" {{ ($datos->alquila) == '2' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td>
             
            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idAlquila')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idAlquila')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Precio</th>
            <td>
              <input readonly value="{{ $datos->precio_alquiler}}"  type="number" min="0" class="form-control" name="precio_alquiler" id="idReciboalqfam" required>
            </td>
            <td>
            <?php if ($datos->alquila == "Si"): ?>
        
             <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
              Recibo Alquiler
               <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->recibo_alquiler_familiar]) }}" alt="..." class="img-responsive lightbox hide">
              </a>
            </td>
              <?php endif; ?>
        
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idReciboalqfam')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idReciboalqfam')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Prestada</th>
            <td>
            
              <select readonly class="form-control" name="prestada" id="idPrestada" required>
                    <option value="1" {{ ($datos->prestada) == '1' ? 'selected' : '' }}>Si</option>
                    <option value="2" {{ ($datos->prestada) == '2' ? 'selected' : '' }}>No</option>
                </select>
            
          </td>            
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idPrestada')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idPrestada')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>

          </tr>

          <tr>
            <th>Otras vivienda</th>
            <td>
              <input readonly value="{{ $datos->otros_vivienda}}"  type="text-area"class="form-control" name="otros_vivienda" id="idOtrosvivienda" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idOtrosvivienda')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idOtrosvivienda')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Posee campo</th>
            <td>
              <select readonly class="form-control" name="tiene_campo" id="idCampo" required>
                    <option value="Si" {{ ($datos->tiene_campo) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->tiene_campo) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idCampo')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idCampo')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Hectáreas</th>
            <td>
              
              <input readonly value="{{ $datos->cant_has}}"  type="number" min="0" class="form-control" name="has" id="cant_has" required>
            </td><td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idHas')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idHas')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Actividad</th>
            <td>
            <input readonly value="{{ $datos->actividad }}"  type="text-area"class="form-control" name="actividad" id="idActividad" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idActividad')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idActividad')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Posee terreno</th>
            <td>
                <select readonly class="form-control" name="tiene_terreno" id="idTerreno" required>
                    <option value="Si" {{ ($datos->tiene_terreno) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->tiene_terreno) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idTerreno')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idTerreno')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Cantidad</th>
            <td>
              <input readonly value="{{ $datos->cant_terreno}}"  type="number" min="0" class="form-control" name="terreno_cant" id="idTerrenocant" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idTerrenocant')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idTerrenocant')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Automóvil</th>
            <td>
                <select readonly class="form-control" name="tiene_auto" id="idAuto" required>
                    <option value="Si" {{ ($datos->tiene_auto) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->tiene_auto) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idAuto')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idAuto')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Cantidad</th>
            <td>
              <input readonly value="{{ $datos->cant_auto}}"  type="number" min="0" class="form-control" name="cant_auto" id="idAutocant" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idAutocant')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idAutocant')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Motovehiculo</th>
            <td>
                <select readonly class="form-control" name="tiene_moto" id="idMoto" required>
                    <option value="Si" {{ ($datos->tiene_moto) == 'Si' ? 'selected' : '' }}>Si</option>
                    <option value="No" {{ ($datos->tiene_moto) == 'No' ? 'selected' : '' }}>No</option>
                </select>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idMoto')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idMoto')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Cantidad</th>
            <td>
              <input readonly value="{{ $datos->cant_moto}}"  type="number" min="0" class="form-control" name="cant_moto" id="idMotocant" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idMotocant')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idMotocant')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

          <tr>
            <th>Otros gastos</th>
            <td>
            
          <select readonly class="form-control" name="otros_gastos" id="idOtrosGastos" required>
          <option value="Si" {{ ($datos->otros_gastos) == 'Si' ? 'selected' : '' }}>Si</option>
          <option value="No" {{ ($datos->otros_gastos) == 'No' ? 'selected' : '' }}>No</option>
          </select>
          </td>            
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idOtrosGastos')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idOtrosGastos')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>



          <tr>
            <th>Otros gastos descripción</th>
            <td>
              <input readonly value="{{ $datos->otros_gastos_descripcion}}"  type="text-area" class="form-control" name="otros_gastos_descripcion" id="idOtrosGastosDescr" required>
            </td>
            <td></td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idOtrosGastosDescr')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idOtrosGastosDescr')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>



          <tr>
            <th>Otros gastos cantidad</th>
            <td>
              <input readonly value="{{ $datos->otros_gastos_cant}}"  type="number" min="0" class="form-control" name="otros_gastos_cant" id="idOtrosGastosCant" required>
            </td>
            <td>
               <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                  Recibo otros gastos
                      <img src="{{ action('InscripcionesController@getFile',['filename' => $datos->otros_gastos_recibo]) }}" alt="..." class="img-responsive lightbox hide">
                  </a> 


            </td>
            <td>
              <a style="display: inline;" onclick="quitarReadOnly('idOtrosGastosCant')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="ponerReadOnly('idOtrosGastosCant')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td>
          </tr>

    </table>
  </td>
  </tr>
</div>  
  </table>
                    


  <table class="rwd_auto table table-responsive table-bordered" width="100%" cellpadding="5" cellspacing="5" border="0">
    <tr>
      <td width="50%">
  <h3 align="center" class="">Grupo Familiar</h3>


  @for ($i = 0; $i < count($familiar)  ; $i++)
  <input type="hidden" value="{{ $familiar[$i]->id}}"  name="{{ $familiar[$i]->id }}" id="familiar{{$i}}" required>
    <div class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#collapseExample{{$i}}" aria-expanded="false" aria-controls="collapseExample">
    <div class="col-md-11">
    <h4 align="left">Familiar {{ $i+1 }}</h4>
    </div>
    <div class="col-md-1 pull-right" style="margin-top: 1%;">
      <span class="glyphicon glyphicon-plus">Ver</span>
    </div>
    </div>  
 <div class="collapse" id="collapseExample{{$i}}"> 
    <table border="1">    
      
        <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="21%">Modificar</td></th></tr>

        <tr>
            <th>Parentesco</th>
            <td> <input readonly value="{{ $familiar[$i]->parentesco}}"  type="text" class="form-control" name="parentesco" id="idParentesco{{$i}}" required>              
            </td>
            <td></td>

          

           <td>
              <a style="display: inline;" onclick="famQuitarReadOnly('idParentesco','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="famPonerReadOnly('idParentesco','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>

          <tr>
            <th>Nombre y Apellido</th>
            <td> <input readonly value="{{ $familiar[$i]->apeynom}}"  type="text" class="form-control" name="apeynom" id="idApeynom{{$i}}" required>              
            </td>
            <td></td>

           <td>
              <a style="display: inline;" onclick="famQuitarReadOnly('idApeynom','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="famPonerReadOnly('idApeynom','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>

          <tr>
            <th>DNI</th>
            <td> <input readonly value="{{ $familiar[$i]->dni}}"  type="text" class="form-control" name="dni" id="idDni{{$i}}" required>              
            </td>
            <td>
                <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                Imagen DNI frente
                    <img src="{{ action('InscripcionesController@getFile',['filename' => $familiar[$i]->imagen_dni_frente]) }}" alt="..." class="img-responsive lightbox hide">
                </a>
                <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                Imagen DNI Dorso
                    <img src="{{ action('InscripcionesController@getFile',['filename' => $familiar[$i]->imagen_dni_dorso]) }}" alt="..." class="img-responsive lightbox hide">
                </a>
            </td>

           <td>
              <a style="display: inline;" onclick="famQuitarReadOnly('idDni','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="famPonerReadOnly('idDni','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>


          <tr>
            <th>Edad</th>
            <td> <input readonly value="{{ $familiar[$i]->edad}}"  type="text" class="form-control" name="edad" id="idEdad{{$i}}" required>              
            </td>
            <td></td>

           <td>
              <a style="display: inline;" onclick="famQuitarReadOnly('idEdad','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="famPonerReadOnly('idEdad','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>

          <tr>
            <th>Ocupación</th>
            <td> <input readonly value="{{ $familiar[$i]->ocupacion}}"  type="text" class="form-control" name="ocupacion" id="idOcupacion{{$i}}" required>              
            </td>
            <td></td>

           <td>
              <a style="display: inline;" onclick="famQuitarReadOnly('idOcupacion','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="famPonerReadOnly('idOcupacion','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>
          

          <tr>
            <th>Actividad laboral </th>
            <td> 
              <select readonly class="form-control" name="actividad_laboral" id="idActividadLaboral{{$i}}" placeholder="Seleccione una opción" required>
                    
                      <option value="activosfam0" {{ ($familiar[$i]->actividad_laboral) == 'activosfam0'  ? 'selected' : '' }}>Empleado Activo o Jubilado</option>
                      <option value="monotrifam0" {{ ($familiar[$i]->actividad_laboral) == 'monotrifam0' ? 'selected' : '' }}>Autónomo o Monotributista</option>
                      <option value="informalfam0" {{ ($familiar[$i]->actividad_laboral) == 'informalfam0' ? 'selected' : '' }}>Trabajador Informal</option>
                </select>
            </td>
            <td></td>

           <td>
              <a style="display: inline;" onclick="famQuitarReadOnly('idActividadLaboral','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="famPonerReadOnly('idActividadLaboral','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>

          <tr>
            <th>Ingresos</th>
            <td> <input readonly type="number" value="{{ $familiar[$i]->ingresos}}" class="form-control" name="ingresos" id="idIngresos{{$i}}" required>
            </td>
            <td>
              @if (!$familiar[$i]->comprobante_ingresos_1 == NULL)
                <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                  Comprobante Ingresos 1
                      <img src="{{ action('InscripcionesController@getFile',['filename' => $familiar[$i]->comprobante_ingresos_1]) }}" alt="..." class="img-responsive lightbox hide">
                  </a>  
              @endif
              @if (!$familiar[$i]->comprobante_ingresos_2 == NULL)
                <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                  Comprobante Ingresos 2
                      <img src="{{ action('InscripcionesController@getFile',['filename' => $familiar[$i]->comprobante_ingresos_2]) }}" alt="..." class="img-responsive lightbox hide">
                  </a>  
              @endif
              @if (!$familiar[$i]->comprobante_ingresos_3 == NULL)
                <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                  Comprobante Ingresos 3
                      <img src="{{ action('InscripcionesController@getFile',['filename' => $familiar[$i]->comprobante_ingresos_3]) }}" alt="..." class="img-responsive lightbox hide">
                  </a>  
              @endif

            </td>

           <td>
              <a style="display: inline;" onclick="famQuitarReadOnly('idIngresos','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="famPonerReadOnly('idIngresos','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>

          <tr>
            <th>Certificación Negativa ANSES</th>
            <td> 
            <td>
              
                <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                  Comprobante
                      <img src="{{ action('InscripcionesController@getFile',['filename' => $familiar[$i]->anses]) }}" alt="..." class="img-responsive lightbox hide">
                  </a>  
              
            </td>

           <td>
              
            </td> 

          </tr>

    
      </table>
</div> 
@endfor   
    
      </td>



  <td width="50%">
  <h3 align="center" class="">Consideraciones particulares</h3>
    @for ($i = 0; $i < count($consideraciones)  ; $i++)
       <div  class="col-md-12 bg-info" style="border-style: solid; border-color: white; margin-top: 1px;"  type="button" data-toggle="collapse" data-target="#collapseconsideraciones{{$i}}" aria-expanded="false" aria-controls="collapseconsideraciones">
         <div class="col-md-11">
           <h4 align="left" class="">Familiar {{ $i+1 }}</h4>         
        </div>
       <div class="col-md-1 pull-right" style="margin-top: 1%;">
            <span class="glyphicon glyphicon-plus">Ver</span>
          </div>       
       </div>
 <div class="collapse" id="collapseconsideraciones{{$i}}"> 
    <table align="center" border="1">
       <input type="hidden" value="{{ $consideraciones[$i]->id}}"  name="{{ $consideraciones[$i]->id }}" id="consideracion{{$i}}" required>
        <tr><th class="bg-info">Datos<td class="bg-info">Información</td><td class="bg-info">Adjuntos</td><td class="bg-info" width="21%">Modificar</td></th></tr>

          <tr>
            <th>Parentesco</th>
            <td> <input readonly value="{{ $consideraciones[$i]->parentesco}}"  type="text" class="form-control" name="parentesco{{$i}}" id="idConParentesco{{$i}}" required>              
            </td>
            <td></td>

           <td>
              <a style="display: inline;" onclick="conQuitarReadOnly('idConParentesco','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="conPonerReadOnly('idConParentesco','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>

          <tr>
            <th>Enfermedad</th>
            <td> <input readonly value="{{ $consideraciones[$i]->enfermedad}}"  type="text" class="form-control" name="enfermedad" id="idConEnfermedad{{$i}}" required>              
            </td>
            <td></td>

           <td>
              <a style="display: inline;" onclick="conQuitarReadOnly('idConEnfermedad','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="conPonerReadOnly('idConEnfermedad','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>
          
          <tr>
            <th>Produce Incapacidad o Enfermedad crónica grave</th>
            <td> <input readonly value="{{ $consideraciones[$i]->incapacidad}}"  type="text" class="form-control" name="incapacidad" id="idConIncapacidad{{$i}}" required>              
            </td>
            <td>
            <?php if ($consideraciones[$i]->incapacidad == "Si"): ?>
              <a href="#" class="thumbnail" data-toggle="modal" data-target="#lightbox"> 
                  Certificado
                      <img src="{{ action('InscripcionesController@getFile',['filename' => $consideraciones[$i]->cert_incapacidad]) }}" alt="..." class="img-responsive lightbox hide">
                  </a>  
            </td>
            <?php endif; ?>
        
           <td>
              <a style="display: inline;" onclick="conQuitarReadOnly('idConIncapacidad','{{$i}}')" class="btn btn-sm btn-primary pull-left" title="Editar" value="Modificar">
              <i class="voyager-edit"></i><span class="hidden-xs hidden-sm"></span></a>
              <a style="display: inline;" onclick="conPonerReadOnly('idConEnfermedad','{{$i}}')" class="btn btn-sm btn btn-success pull-right" title="Guardar" value="Guardar">
              <i class="voyager-check"></i><span class="hidden-xs hidden-sm"></span></a>
            </td> 

          </tr>


  </table>
    </div>
      @endfor
  </td>
  </tr>
  </table>



<table class="rwd_auto table table-responsive table-bordered" width="100%" cellpadding="5" cellspacing="5" border="0">
    <tr>
      <td width="100%" class="bg-info">
    
    <h4 align="left" class="">Motivos del estudiante</h4>     
        

          <tr>
            
            <td>{{ $datos->motivos}}</td>
          </tr>

      </table> 


<div id="lightbox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <button type="button" class="close hidden" data-dismiss="modal" aria-hidden="true">X</button>
        <div class="modal-content">
            <div class="modal-body">
                <img src="" alt="" />
                 <div class="modal-footer">
              <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
            </div>
            </div>
        </div>
    </div>
</div>



     
{!! Form::open(['route' =>'carga', 'method' => 'post' ]) !!}
<div class="col-md-12 bg-info bordered" style="text-align: center;">
    <label><h3>Conformación del puntaje postulante</h3></label>
</div>

<div class="row">
  @if($datos->revision==0 or $datos->revision==1 or $datos->band==0)

  <div class="col-md-12 label-default" style="margin-left: 1.25%; border-style: solid; border-width: 1px; border-color: #333; border-radius: 5px; max-width: 97.5%;" >
    <h4 >
      <font size="2px"><center>Realizar una acción con los datos cargados por el estudiante para luego poder calcular el merito</center></font>
    </h4>
  </div>
 
    <div class="row">
      <div class="col-md-12">
          <div class="col-md-4" style="margin-left: 30%;">
                <strong><font color="red">¿Los datos que se observan del postulante son correctos?</font></strong><br>
                <input type="radio" name="revision" value="1" {{ ($datos->revision) == '1' ? 'checked': ''}}/> <strong>Datos incompletos o inconsistentes</strong>  <span class="glyphicon glyphicon-info-sign" title="Datos incompletos o inconsistentes no se lo incluirá en la orden de merito"></span><br>
                <input type="radio" name="revision" value="2" {{ ($datos->revision) =='2' ? 'checked': ''}}/> <strong>Datos correctos</strong>  <span class="glyphicon glyphicon-info-sign" title="Datos correctos, se incluye al postulante en la orden de merito"></span>
                <div>
                 @if($datos->revision==1)
               <span class="label-danger" style="color: white">&nbsp; El postulante presenta inconsistencias.</span><br>
                @endif
               </div>

               <div>
               <input type="hidden" name="id" value="{{$datos->id}}">
               <button class="btn btn-primary" type="submit" name="submit" >Aceptar</button>

{!! Form::close() !!}  


                @if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') )
                <form action="{{route('dar_baja')}}" method="POST" autocomplete="off">
               {{ method_field('DELETE')}} {{csrf_field()}}
               <input type="hidden" name="id" value="{{$datos->user_id}}">
               
                <button type="submit" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">Eliminar inscripción</button>
                </form>
                 @endif
                </div>

          </div>
      </div>       
    </div>


  
  <?php
    
     $style = 'margin-left: 30%;';
  ?>
  
  @else
  <?php
    $style = '';
  ?>
    

    
      <div class="col-md-6" >
          <div class="panel panel-success" id="panelAuxiliar">
              <div class="panel-heading">
                  <label>
                  Valores auxiliares que se utilizaran para calcular el mérito
                </label>
              </div>
              <div class="panel-body">
                <table id="tablaCalculoAuxiliar" class="table table-responsive table-hover">                 
                  <tr><th class="col-md-6">Mínimo vital y móvil</th>
                  <td class="col-md-4"><font color="black">$ {{$calculos->minimo_vital_movil}}</font></td>
                  </tr>
                  <tr><th class="col-md-6">Precio colectivo urbano</th><td align="right"><font color="black">$ {{$calculos->precio_urbano}}</font></td></tr>
                  <tr><th class="col-md-6">Año</th><td  align="right"><font color="black">{{$calculos->anio}}</font></td></tr>
                  <tr><th class="col-md-6">Fecha de última modificación</th><td align="right"><font color="black">{{$calculos->updated_at}}</font></td></tr>
                
              </table>
              </div>
              <div class="panel-footer">
                <div class="row">
                    <div class="col-sm-pull-4 pull-left"  style=" margin-right: -1%; margin-left: 2%;">
                        {!! link_to_route('merito', 'Calcular mérito', ['beca_id'=>$datos->beca_id,'datos_id' => $datos->id],['class'=>'btn btn-danger btn-sm','style'=>'font-size:13px']) !!}
                    </div>
                    <div class="col-sm-pull-8 pull-right" style="margin-right: 2%; margin-left: -1%;">
                        {!! link_to_route('restablecer', 'Restablecer evaluación de inscripción', ['beca_id'=>$datos->beca_id,'datos_id' => $datos->id],['class'=>'btn btn-warning btn-sm','style'=>'font-size:13px']) !!}
                    </div>
                    
                </div>
                
              
              </div>
          </div>         
    </div>
  
  @endif
      <div id="divPuntaje" class="col-md-6" style="<?php echo $style;?>">
        <div class="panel panel-success" id="panelPuntaje">
            <div class="panel-heading">               
                  <label>Puntaje</label>
            </div>
            <div class="panel-body">
                <table id="tablaPuntajeMerito" class="table table-responsive table-hover">
                    <tr>
                      <th class="col-md-6">Puntaje procedencia</th>
                      <td class="col-md-3">
                        <label class="pull-right">{{$inscrip->pto_procedencia}}</label>
                      </td>
                    </tr>
                    <tr>
                      <th class="col-md-6">Puntaje por situación Ingresos</th>
                      <td class="col-md-3">
                        <label class="pull-right">{{$inscrip->pto_ingresos}}</label>
                      </td>
                    </tr>

                    <tr>
                      <th class="col-md-6">Puntaje por Enfermedades</th>
                      <td class="col-md-3">
                        <label class="pull-right">{{$inscrip->pto_enfermedad}}</label>
                      </td>                      
                    </tr>

                    <tr>
                      <th class="col-md-6">Puntaje por situación académica</th>
                      <td class="col-md-3"> 
                        <label class="pull-right">{{ $inscrip->pto_academica}}</label>
                      </td>                      
                    </tr>

                    <tr align="center">
                      <th class="col-md-6"><font color="red"><strong>Total</strong></font></th>
                      <td class="col-md-3">
                        <label class="pull-right">{{$inscrip->merito}}</label>
                      </td>
                    </tr>
                </table>
            </div>
        </div>        
    </div>





    
    <div class="col-md-12">
      <h3 align="center"> <a href="/administracion/inscripciones"><span class="label label-primary text-white" align="center" >Volver</span></a></h3>
    </div>

</div>


<div class="modal fade modal-danger" id="exampleModal" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
                    <input type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
        <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }} ?</h4>
      </div>
      <div class="modal-body">
       <h4>Estás seguro que quieres borrar los datos de inscripcion?</h4>
      </div>
      <div class="modal-footer">      
      <input type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}
      <input type="button" class="btn btn-danger">{{ __('voyager::generic.delete_confirm') }}
      </div>
    </div>
  </div>
</div>




<br><br><br><br><br>

<br><br><br><br><br>




@endsection
<script type="text/javascript">
$('#myModal').modal('show')
</script>

<script>
  $(document).ready(function() {
    var $lightbox = $('#lightbox');
    
    $('[data-target="#lightbox"]').on('click', function(event) {
        var $img = $(this).find('img'), 
            src = $img.attr('src'),
            alt = $img.attr('alt'),
            css = {
                'maxWidth': $(window).width() - 100,
                'maxHeight': $(window).height() - 100
            };
    
        $lightbox.find('.close').addClass('hidden');
        $lightbox.find('img').attr('src', src);
        $lightbox.find('img').attr('alt', alt);
        $lightbox.find('img').css(css);
    });
    
    $lightbox.on('shown.bs.modal', function (e) {
        var $img = $lightbox.find('img');
            
        $lightbox.find('.modal-dialog').css({'width': $img.width()});
        $lightbox.find('.close').removeClass('hidden');
    });
});
</script>