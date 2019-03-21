@extends('voyager::master')

@section('content')


    <h3>Administrador de la base de datos de copia de seguridad</h3>

<br><br>
<div class="row">


<div class="col-sm-8 clearfix" >
      

 @if(count($beca))
 <table class="table table-striped table-bordered" id="tabla" align="center">
                    <thead>
                    <tr>
                        <th>Beca</th>
                        <th>Año</th>
                        <th>Acción</th>
                    </tr>
                    </thead>
                    <tbody>
                        <strong>Seleccione la beca que desea realizar la copia de seguridad de manera individual,<font color="blue"> solo imágenes y archivos PDF</font></strong>
              @foreach($beca as $unabeca)
                        <tr>
                            <td>{{ $unabeca->nombre }}</td>
                            <td>{{ $unabeca->anio }}</td>
                            <td >
                                
<a href="{{ url('/administracion/backup/create/'.$unabeca->id) }}" class="btn btn-primary"> Realizar copia de seguridad</a>
                            
                            </td>
                        </tr>
                    @endforeach

                    </tbody>

    </table>
        <div class="dropdown dropright" >
        <a href="#" class="dropdown-menu-right" data-toggle="dropdown" role="button" aria-expanded="false" ><button type="button" class="btn btn-primary active">Realizar copia de seguridad</button></a>
        <ul class="dropdown-menu" role="menu" >
            <li>
                <a id="create-new-backup-button" href="{{ url('/administracion/backup/create/'.$unabeca->id="completo") }}" class="btn btn-primary"><i class="fa fa-plus"></i> Crear una nueva copia de seguridad completa</a>
            </li>
            <li>
                <a id="create-new-backup-button" href="{{ url('/administracion/backup/create/'.$unabeca->id="datos") }}" class="btn btn-primary" ><i class="fa fa-plus"></i> Crear un nueva copia de seguridad solo de la base de datos</a>
            </li>
        </ul>
    </div>
</div>

@else
<div class="well">
    <h4>No existe ninguna beca</h4>
</div>
@endif



        <div class="clearfix col-xs-12">
            @if (count($backups))

                <table class="table table-striped table-bordered" id="myTable">
                    <thead>
                    <tr>
                        <th>Archivo</th>
                        <th>Tamaño</th>
                        <th>Fecha</th>
                        <th>Acción</th>
                    </tr>
                    </thead>
                    <tbody>
                        Las copias de seguridad se encuentran en el directorio: <strong>{{$ubicacion}}.</strong>
                        <br><br>
              @foreach($backups as $backup)
                        <tr>
                                  <td>{{ $backup['file_name'] }}</td>
                            <td>{{($backup['file_size']) }}</td>
                            <td>
                                {{ $backup['last_modified'] }}
                            </td>
                           
                            <td >
                                <a class="btn btn-xs btn-default"
                                   href="{{  route('backDownload', $backup['file_name']) }}"><i
                                        class="fa fa-cloud-download"></i> Descargar</a>
                                <a class="btn btn-xs btn-danger" onclick="
return confirm('¿Esta seguro que quiere eliminar esta copia de seguridad?')" data-button-type="delete"
                                   href="{{ url('/administracion/backup/delete/'.$backup['file_name']) }}"><i class="fa fa-trash-o"></i>
                                    Eliminar</a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            @else
                <div class="well">
                    <h4>No existe ninguna copia de seguridad</h4>
                </div>
            @endif
        </div>
    </div>




@stop





@section('javascript')
<script>

$(document).ready( function () {
    $('#myTable').DataTable({

paging: true,
    searching: true,
    "bInfo" : true,
    
    "language":
    {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",

        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":     "Último",
            "sNext":     "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    },
    
} );

    });

</script>

@endsection