
<!DOCTYPE HTML>
<html lang="es-ES">
<head>
    <meta charset="UTF-8">
    <!--cargamos los archivos css y js-->
    
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-2.1.0.min.js"></script>
    
    <title>Ajax con Laravel 4</title>
</head>
<body>
<div class="row">
    <h2 class="subheader">Selects dependientes en laravel a tres niveles</h2>
    <div class="small-12 columns">
        <div class="form">
        
            
            {!! Form::select('provincia', $provincia, null, ['id' => 'provincia']) !!}

            {!! Form::select('localidad', ['placeholder'=>'Selecciona una provincia'], null, ['id'=>'localidad']) !!}
            
        
        </div>
    </div>
</div>





<script>
    $("#provincia").change(function (event) {
            var countryId = $(this).val();
            $("#localidad").empty();

        $.get("datospersona/localidad/"+event.target.value+"", function(response, state) {
            for(i=0; i<response.length; i++){
                $("#localidad").append("<option value='"+response[i].id+"'>"+response[i].localidad+" </option>");
            }
            });
    });
</script>


</body>
</html>