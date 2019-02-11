@extends('layout')
@section('contenido')


@if(!empty($aux))
	@if($aux->habilitada==0)<!--Habilitacion beca-->
		 <div align="center">
		 <h3>Ninguna beca se encuentra habilitada vuelva luego</h3>
		 </div>
	@else($aux->habilitada==1) <!--habilitada la beca-->
		@include('datospersona.form',['user'])
	@endif
@else
	 <h3>Ninguna beca se encuentra habilitada, vuelva luego</h3>
@endif


<br><br><br>

@include('footer')
@endsection


