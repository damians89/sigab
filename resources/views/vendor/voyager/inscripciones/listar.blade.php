@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop
@section('content')



<h1><p align="center">Panel administrativo de inscripciones</p></h1>
<h3>Bienvenido {{Auth::user()->name}} </h3>


{!! Form::open(['action' => 'InscripcionesController@seleccion','method' => 'post'] ) !!}
<br>
<div align="center" class=""  >
	<h4>Seleccionar la beca para listar los inscritos: </h4>
	<div class="" align="center" class="form-control">
	<select name = 'beca' >
		@foreach($becas as $beca)
			<option value="{{$beca->id}}" >Nombre: {{$beca->nombre}} - Año: {{$beca->anio}}</option>
		@endforeach
	</select>
	
{!!Form::submit('Listar Inscriptos',array('class'=>'btn btn-primary btn-small'))!!}
	</div>
</div>
{!! Form::close() !!}

@endsection