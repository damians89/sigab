<h2>Bienvenido {{Auth::user()->name}} al panel de administración de becas FCYT</h2>

@inject('inscripcion', 'App\Http\Controllers\InscripcionesController')    

<br><br>


<h4>A continuación se detalla el contenido de su estado de inscripción </h4>
<br>


@foreach( $inscripcion->se_inscribio() as $inscrip)

<center>
<table class="table-responsive" border="4" width="80%" cellpadding="5" cellspacing="5">
<thead>
<tr>
	<th class="badge-primary"><div align="center">Nombre de la beca</div></th>
	<th class="badge-primary"><div align="center">Año de beca</div></th>
	<th class="badge-warning"><div align="center">Información</div></th>
	<th class="badge-dark"><div align="center">Comprobante</div></th>
	
</tr>
</thead>
<tbody>

<tr align="center">
	<td style="width: 180px">{{$inscrip->beca_nombre}}</td>
	<td style="width: 180px">{{$inscrip->anio}}</td>
	<td>


@foreach( $inscripcion->revision($inscrip->user_id) as $inscrip1)


	@if($inscrip->beca_id == $inscrip1->beca_id)
		@if ($inscrip1->revision == 0)
			Sus datos están siendo procesados
			
		@else
			@if($inscrip1->revision == 1)
			Sus datos son incorrectos o inconsistentes
			<h6>Por favor comuníquese con Secretaría de Bienestar Estudiantil</h6>
			@else
				@if($inscrip1->revision == 2)
					@if($inscrip->otorgamiento==1)
						<h5><font color="black">Fuiste beneficiado con la beca, visualiza las <a href="/administracion/cronogramas" color="black" style="">Fechas de cobro.</a></font></h3>
					@else
						@if($inscrip->otorgamiento==2)
							Sus datos ya fueron chequeados
							<h6 >Espere el cierre de inscripción de la beca para visualizar si se le otorgó el beneficio</h6>
						@else
							@if($inscrip->otorgamiento==0)
								<h5><font color="black">El mérito obtenido no alcanzó para el otorgamiento del beneficio.</font></h3>
							@else($inscrip->otorgamiento=="Suspendida")
								<h5><font color="black">Tu beca fue suspendida.</font></h3>	
							@endif
						@endif		
					@endif
				@else
				@endif	
			@endif
		@endif
	@else 

	@endif
@endforeach
	</td>	
	<td>
	<form method="POST" action="{{ route('comprobante') }}">
	 {{ csrf_field() }}
	 <input type="hidden" name="user_id" value="{{$inscrip1->user_id}}" >
	<input type="hidden" name="datos_id" value="{{$inscrip1->id}}" >
	<input type="hidden" name="beca_id" value="{{$inscrip1->beca_id}}" >
	<button value="submit" type="submit" class="btn btn-sm btn-primary"><h6>Obtener comprobante</h6></button>
	</form>
	</td>
</tr>

</tbody>
</table>
</center>
<br>	





@endforeach


