@extends('voyager::master')

@section('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->display_name_singular)

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->display_name_singular }}
    </h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
              action="{{ (isset($dataTypeContent->id)) ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->id) : route('voyager.'.$dataType->slug.'.store') }}"
              method="POST" enctype="multipart/form-data" autocomplete="off">
            <!-- PUT Method if we are editing -->
            @if(isset($dataTypeContent->id))
                {{ method_field("PUT") }}
            @endif
            {{ csrf_field() }}

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-bordered">
                    {{-- <div class="panel"> --}}
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="panel-body">
                            <div class="form-group">
                                <label for="name">Ingrese el nombre de la beca</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre de la beca"
                                       value="@if(isset($dataTypeContent->nombre)){{ $dataTypeContent->nombre }}@endif">
                            </div>
                             <div class="form-group">
                                <label for="apellido">Ingrese una breve descripción de la beca</label>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Ingrese una breve descripción de la beca"
                                       value="@if(isset($dataTypeContent->descripcion)){{ $dataTypeContent->descripcion }}@endif">
                            </div>
                            
                            <div class="form-group">
                                <label for="periodo_desde">Periodo desde</label>
                                <input type="date" class="form-control" id="periodo_desde" name="periodo_desde"
                                       value="@if(isset($dataTypeContent->periodo_desde)){{ \Carbon\Carbon::parse($dataTypeContent->periodo_hasta)->format('Y-m-d')}}@endif">
                            </div>

                            <div class="form-group">
                                <label for="periodo_hasta">Periodo hasta</label>
                                <input type="date" class="form-control" id="periodo_hasta" name="periodo_hasta"  value="@if(isset($dataTypeContent->periodo_hasta)){{ \Carbon\Carbon::parse($dataTypeContent->periodo_desde)->format('Y-m-d')}}@endif">
                            </div>


                            <div class="form-group">
                                <label for="periodo_hasta">Ingrese el monto mensual de la beca</label>
                                <input type="numer" class="form-control" id="monto" name="monto" placeholder="monto mensual"
                                       value="@if(isset($dataTypeContent->monto)){{ $dataTypeContent->monto }}@endif">
                            </div>


                            <div class="form-group">
                                <label for="periodo_hasta">Estado de beca - Habilitación</label>
                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="Debes poseer una sola beca habilitada en el sistema, para que se inscriban a la que tiene estado habilitado">
                                    </span>

    <br>

 <input type="radio" name="habilitada" onclick="verificar('@if (isset($dataTypeContent->id))@endif')" value=1 @if(isset($dataTypeContent->habilitada)){{ ($dataTypeContent->habilitada==1 ? 'checked' : '')}} @endif/>  
    <label for="option-habilitada-si" class="badge badge-danger badge-lg" style="color: white">Habilitar</label>


   

<input type="radio" name="habilitada" onclick="verificar_no('@if(isset($dataTypeContent->id ))@endif')" value=0 @if(isset($dataTypeContent->habilitada)) {{ ($dataTypeContent->habilitada==0 ? 'checked' : '')}} @endif/> 
    <label for="option-habilitada-no" class="badge badge-default badge-lg" style="color: white">No habilitar</label>
                                </div>


                            <div class="form-group">
                                <label for="periodo_hasta">Ingrese el año de la beca</label>
                                <input type="number" class="form-control" id="anio" name="anio" placeholder="Año"
                                       value="@if(isset($dataTypeContent->anio)){{ $dataTypeContent->anio }}@endif">
                            </div>

                            <div class="form-group">
                                <label for="calculo_id">Seleccione el cálculo auxiliar para el cómputo de la beca</label><br>
                                @if(count($calculos)!=0)
                                <select name="calculo_id" required class="form-control">
                                  <option value="">Seleccione una opción</option>
                                  @foreach($calculos as $uncalculo)
                                  <option value="{{$uncalculo->id}}" {{ ($dataTypeContent->id_calculos_auxiliares) == ($uncalculo->id) ? 'selected' : '' }}>
                                    Mínimo vital móvil: ${{$uncalculo->minimo_vital_movil}} - Precio colectivo urbano: ${{$uncalculo->precio_urbano}} - Año: {{$uncalculo->anio}}
                                  </option>
                                  @endforeach
                                </select>
                                @else
                                <label class="badge badge-info badge-lg" style="color: white;"><a href="/administracion/calculos-aux">
                                  <font color="white">Porfavor cree un calculo auxiliar</font></a></label>
                                  
                                @endif
                            </div>


                            

 @if(count($calculos)!=0)
                               
            <button type="submit" class="btn btn-primary pull-right save" name="botonsito" id="botonsito">
                {{ __('voyager::generic.save') }}
            </button>
            @endif
                    </div>
                </div>

            </div>

        </form>

    </div>
@stop
@section('javascript')
    <script>
        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();
        });
    </script>
    <script type="text/javascript">
         function verificar(estado)
              {
                if(estado==0){
                  var valor = '';
                }else{
                var valor = $("#"+estado).val();
                }

                $.ajax({
                  type: "POST",
                  url: '/verificar',
                  dataType: 'JSON',
                  data:{"estado":estado,},
                  success: function(data){
                 toastr.warning(data.message)
                 if(data.valor==0){
                 document.getElementById('botonsito').disabled=true;
                 }else{
                 document.getElementById('botonsito').disabled=false;
                    
                 }
                  }   
                });

              }


         function verificar_no(estado)
              {
                if(estado==0){
                  var valor = '';
                }else{
                var valor = $("#"+estado).val();
                }

                document.getElementById('botonsito').disabled=false;                    
              }







    </script>
@stop



