@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
@section('content')

<h1><p align="center">Panel administrativo de inscripciones</p></h1>
<h3>Bienvenido {{Auth::user()->name}} </h3>


{!! Form::open(['route' => 'guarda_observacion', 'method' => 'post' ]) !!}
<input type="hidden" name="id" value="{{$inscrip->id}}">
<input type="hidden" name="user_id" value="{{$inscrip->user_id}}">

<br>
<div align="center">
<h3 class="text-primary">Agregar observación a la inscripción de {{$inscrip->user_nombre}} </h3>
<br>
<p>
 &rarr;	El postulado obtuvo <font color="red"><strong>{{$inscrip->merito}}</strong></font> en el cálculo de méritos, si desea cambiarlo complete el siguiente cuadro.<br>
Méritos: 
<input type="numeric" name="meritos_new" placeholder="ingrese solo numeros" value="{{$inscrip->merito}}" required>
<br><br>


 &rarr;	El postulado tiene de estado de su otorgamiento: <font color="red"><strong>{{$inscrip->otorgamiento}}</strong></font><br>
Si desea puede cambiarla:

<select name="otorgamiento" placeholder="seleccione una opcion" required>
	<option value="Si" {{ ($inscrip->otorgamiento) == 'Si' ? 'selected' : '' }}>Otorgar (Si)</option>
	<option value="No" {{ ($inscrip->otorgamiento) == 'No' ? 'selected' : '' }}>Denegar (No)</option>
	<option value="Pendiente" {{ ($inscrip->otorgamiento) == 'Pendiente' ? 'selected' : '' }}>Pendiente (Sin Calcular merito)</option>
	<option value="Suspendida" {{ ($inscrip->otorgamiento) == 'Suspendida' ? 'selected' : '' }}>Suspender (Suspendida)</option>
</select>

<br><br>
 &rarr;	El postulado tiene de observación <font color="red"><strong>{{$inscrip->observacion}}</strong></font> si desea cambiarlo complete el siguiente cuadro.<br>
Observación: <br>
<textarea name="obs_new" rows="4" cols="50" placeholder="Complete en el caso que desee agregar una observacion." required>{{ $inscrip->observacion}}</textarea>
<br>

 
</p>

<button name="btn" value="s" type="submit" class="btn btn-success">Guardar cambios</button>
<a href="{{URL::previous()}}" class="button btn-secondary">Cancelar</a>
</div>



{!! Form::close() !!}



@endsection

