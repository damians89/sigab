@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">



@stop
<!--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
-->




@section('content')

<!--@if (session('message'))
        <div class="alert alert-success">
         {{ session('message') }}
        </div>
    @endif
-->
<h1><p align="center">Panel administrativo de inscripciones</p></h1>
<h3>Bienvenido {{Auth::user()->name}} </h3>






<br><br>

{!! Form::open(['route' => 'otorgar', 'method' => 'post' ]) !!}

<div class="table-dark table-bordered table-hover table-responsive" id="lista">
	<table class="" id="myTable" style="font-size:14px" width="100%" cellspacing="0" cellpadding="0">
		<thead >
			<tr>
				<th width="4%">#</th>
				<th class="col-md-2">Apellido Nombre</th>
				<th class="col-md-1">DNI/Pasaporte</th>
				<th class="col-md-1">Sede</th>
				<th class="col-md-1">Méritos</th>
				<th class="col-md-1">Otorgada</th>
				<th class="col-md-2">Observación</th>
				<th class="col-md-2">Acciones</th>
			</tr>
		</thead>
		@if(count($inscrip)==null)
		<h3>No se posee inscriptos</h3>
		@else
		<tbody>
	
		@foreach($inscrip as $inscriptos)

<?php if ($inscriptos->otorgamiento == "No"): ?>
				<tr style="background-color: #9999CC; color: black;">
<?php endif; ?>
<?php if ($inscriptos->otorgamiento == "Suspendida"): ?>
			<tr style="background-color: #993300; color: black;">
<?php endif; ?>
<?php if ($inscriptos->otorgamiento == "Si"): ?>
			<tr style="background-color: #339933; color: black; ">
<?php endif; ?>
<?php if ($inscriptos->otorgamiento == "Pendiente"): ?>
			<tr style="background-color: #999999; color: black;">
<?php endif; ?>
				<td>
				{{$loop->index + 1}} - <input type="checkbox" hidden  name="id" value="{{$inscriptos->user_id}}">
				<input type="hidden" name="user_id" value="{{$inscriptos->user_id}}">
				<input type="hidden" name="datos_id" value="{{$inscriptos->datos_id}}">
				<input type="hidden" name="beca_id" value="{{$inscriptos->beca_id}}">

				</td>


				<td class="col-md-2">
					{{ $inscriptos->user_apellido }}, {{ $inscriptos->user_nombre }}
				</td>

				<td class="col-md-1">
					{{$inscriptos->dni}}
				</td>

				<td class="col-md-1">
					{{ $inscriptos->sede_nombre }}
				</td>
				<td class="col-md-1">
					{{ $inscriptos->merito }}
				</td>

				<td class="col-md-1">
					{{$inscriptos->otorgamiento}} 
				</td>


				<td class="col-md-2">
					{{ $inscriptos->observacion }}
				</td>


				<td>
				<div class="btn-group-sm">
				         {!! link_to_route('observacion', 'Modificar', ['user_id'=>$inscriptos->user_id], ['class'=>'btn btn-success btn-sm']) !!}

					                {!! link_to_route('datos_usuario', 'Ver', ['user_id' => $inscriptos->datos_id,'beca_id'=>$inscriptos->beca_id],['class'=>'btn btn-warning btn-sm']) !!}


                    			@if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') )

				         			<input type="button"  class="btn btn-danger" type="button" data-toggle="modal" data-target="#exampleModal" value=" Eliminar"> 	

							<div class="modal fade modal-danger" id="exampleModal" data-backdrop="static" data-keyboard="false" tabindex="-1"  role="dialog">
								<div class="modal-dialog" >
									<div class="modal-content">
										<div class="modal-header">
						                    <h4 class="modal-title"><i class="voyager-warning"></i> Estás seguro que quieres eliminar esta inscripcion?</h4>
						                    </div>
						                    <div class="modal-footer">
						                    	<input  class="btn btn-default" data-dismiss="modal" value="{{ __('voyager::generic.cancel') }}">
						                    	<a href="{{route('dar_baja_inscripcion', ['datos_id'=>$inscriptos->datos_id, 'beca'=>$inscriptos->beca_id])}}"  class="btn btn danger"><input  class="btn btn-danger" value="Si">
						                    	</a>
						                    </div>
						            </div>
						        </div>
						    </div>
                  
	      						@endif              
                   
                	</div>
				</td>
			</tr>
		@endforeach
</tbody>
		</table>

 <div class="col-md-12 text-center">
      <ul class="pagination pagination-lg pager" id="myPager"></ul>
      </div>
</div>


<br><br>
	

<div class="container-fluid" style="border: 1px solid #5D0232; padding: 3px; text-align: center;">
@if(Auth::user()->role_id == '1' or Auth::user()->role_id == '3')

<strong><font color="black">
Ingrese la cantidad de becas a otorgar.</font></strong>
<input type="number" name="cant_otor" placeholder="Ingrese la cantidad de becas a otorgar" required>

<button type="submit" class="btn btn-primary btn-info" type="submit">Otorgar</button>
@else
<strong><font color="black">
No tienes permisos para otorgar becas</font></strong>

@endif
</div>
{{ Form::close() }}



<div class="dropdown dropright" >			
	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><button type="button" class="btn btn-primary active">Reportes en PDF</button></a>
      	<ul class="dropdown-menu" role="menu">
<li>
{!! link_to_route('generate-pdf', 'Crear Pdf con todos los postulantes', ['pdf' => 'Todos','beca_id'=>$inscriptos->beca_id], ['class'=>'btn btn-primary btn-xs'] ) !!}
</li>
<li>
{!! link_to_route('generate-pdf', 'Crear Pdf con los Pendientes', ['pdf' => 'Pendiente','beca_id'=>$inscriptos->beca_id], ['class'=>'btn btn-default btn-xs'] ) !!}
</li>
<li>
{!! link_to_route('generate-pdf', 'Crear Pdf con los otorgados', ['pdf' => 'Si','beca_id'=>$inscriptos->beca_id], ['class'=>'btn btn-success btn-xs'] ) !!}
</li>
<li>
{!! link_to_route('generate-pdf', 'Crear Pdf con los NO otorgados', ['pdf' => 'No','beca_id'=>$inscriptos->beca_id], ['class'=>'btn btn-warning btn-xs'] ) !!}
</li>
<li>
{!! link_to_route('generate-pdf', 'Crear Pdf con los Suspendidos', ['pdf' => 'Suspendida','beca_id'=>$inscriptos->beca_id], ['class'=>'btn btn-danger btn-xs'] ) !!}
</li>
</ul>

@endif <!--If de queesta vacia-->
</div>

@endsection
  



@section('javascript')
<script>

$(document).ready( function () {
    $('#myTable').DataTable({

paging: true,
    searching: true,
    "bInfo" : true,
    
    "language":
    {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",

        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    },
    
} );

    });

</script>
@endsection