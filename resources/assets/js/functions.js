$(document).ready(function() {
    //al cambiar la provincia en el select localidades pintamos
    //todas las de esa provincia
    $("#provincia").bind('change',function() {
        var provincia = $('#provincia').val();
        $.post("provincia/localidades", {provincia : provincia}, function(data)
        {
            var localidades = "";
            for(datos in data.localidades){
                localidades += '<option value="'+data.localidades[datos].id+'">'+data.localidades[datos].localidad+'</option>';
            }
            $('select#localidades').html(localidades);
            //llenamos el cpostal con el código de la primera localidad
            
        });
    })
 
    
});