@extends('layout')
@section('contenido')

{{$datos->user_id}}

@include('datospersona.form',['$datos->user_id '])

@endsection



