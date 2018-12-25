@extends('layout')


@section('contenido')

<section id="demos">
          
<div align="center">
@if(Auth::user())
	@if(Auth::user()->role_id==2)
		<h1><a href="/datospersona/create">Postulate a una beca!</a></h1> 
	@else
		<h1><a href="/administracion">Ingresar a la administración de beca!</a></h1> 
	@endif
@else      
	<h1><a href="/login">Regístrate y postulate a una Beca</a></h1>
@endif
</div>


<br><br>
<br><br>
<br><br>
<br><br>      
    </section>
      
@include('footer')

@stop
