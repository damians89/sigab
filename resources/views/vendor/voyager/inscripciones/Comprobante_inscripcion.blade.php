<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Listado de becados</title>
	
	<div align="center">
		<?php $image_path = '/img/logo-web-full-color-sin-fondo_1.png'; ?>
		<img src="{{ public_path() . $image_path }}">
	</div>
	<br>
	<div align="right">
		<strong>{{$dt}}</strong>
	</div>
</head>

<body>
<div>
<br><br>
Orden de inscripción:<strong> {{$inscrip->id}}.</strong>
<br><br>
<strong>{{$inscrip->user_nombre}} {{$inscrip->user_apellido}} </strong> fue exitosamente inscrito en la beca: {{$inscrip->beca_nombre}} en la fecha <strong>{{$inscrip->created_at }}</strong>.
</div>

</body>



</html>