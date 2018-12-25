@include('layout')
<div class=row>

<div class="form-group">
   {{ Form::label('name', 'Nombre:') }}
   {{ Form::input('text', 'name', null, array('class' => 'form-control')) }}
</div>
<div class="form-group">
   {{ Form::label('email', 'Email:') }}
   {{ Form::input('email', 'email', null, array('class' => 'form-control')) }}
</div>
<div class="form-group">
   {{ Form::label('subject', 'Asunto:') }}
   {{ Form::input('text', 'subject', null, array('class' => 'form-control')) }}
</div>
<div class="form-group">
   {{ Form::label('msg', 'Mensaje:') }}
   {{ Form::textarea('msg', null, array('class' => 'form-control')) }}
</div>
{{ Form::input('hidden', 'contacto') }}
{{ Form::input('submit', null, 'Enviar', array('class' => 'btn btn-primary')) }}
</div>
@extends('footer')