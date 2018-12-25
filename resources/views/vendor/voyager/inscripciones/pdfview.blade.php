<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Listado de becados</title>
	<link rel="stylesheet" type="text/css" href="css/app.css">
	
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
<div class="table-responsive ">
	<table class="table table-bordered " align="center" width="100%" style="font-size:9px" height="10px">
			<thead>
				<tr>
					<th>#</th>	
					<th>Apellido y Nombre</th>
					<th>DNI</th>
					<th>Sede</th>
					<th>Carrera</th>
				</tr>
			</thead>
			@foreach($inscrip as $inscriptos)
				<tr>

					<td>
						{{$loop->index + 1}}
					</td>
					<td>
						{{ $inscriptos->user_apellido }}, {{ $inscriptos->user_nombre }} 
					</td>
					<td>
						{{$inscriptos->user_dni}}
					</td>
					<td>
						{{$inscriptos->sede_nombre}}
					</td>
					<td>
						{{ $inscriptos->carrera_nombre}}
					</td>
					</tr>

			@endforeach
	</table>	
</div>
</body>
</html>