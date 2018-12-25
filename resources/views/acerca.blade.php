@include('layout')
<div class="table table-info col-sm-8">
Este software se desarrolló en el marco de la cátedra
taller de integración como trabajo final de carrera.
<br>
<a href="">Descargar manual de usuario.</a>
<br>
@if( Auth::user()->role_id==1 or Auth::user()->role_id==3 or Auth::user()->role_id==4 )
<a href="">Manual de ayuda del administrador</a>
@endif
</div>
<br><br><br><br><br><br>
@extends('footer')