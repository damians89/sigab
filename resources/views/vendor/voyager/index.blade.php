@extends('voyager::master')

@section('content')
    <div class="page-content">
        @include('voyager::alerts')
        
        @if( (Auth::user()->role_id == '1') or (Auth::user()->role_id == '3') or (Auth::user()->role_id == '4') )
        
        <h2>Bienvenido al panel Administrativo para las Becas FCyT - UADER </h2> <br>
        <br>



        @include('voyager::dimmers')
        @else
        @include('voyager::normal')
        @endif

    </div>
@stop

@section('javascript')

   
@stop