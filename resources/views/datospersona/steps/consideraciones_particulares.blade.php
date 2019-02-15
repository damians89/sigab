
<div class="tab-pane" role="tabpanel" id="step8">

  <div class="container">
      <div class="row">
        <h3>1.8 – Consideraciones particulares</h3>
      </div>
    
                        
<p>Si así es el caso, detalle las enfermedades que afectan a los miembros del grupo familiar (Presentación de los certificados médicos correspondientes, diagnóstico y medicación)</p>


  <div class="col-sm-offset-2 col-sm-6" >

        <div id="proposalAccordion">
          
          <div id="tab_logiccon"> 
   

          </div>        
    

      </div>  <!--  cierra tablogic -->

    </div> <!--  cierra div according -->

<div class="col-sm-offset-2 col-sm-6">
      
      
    <a id="add_con" class="btn btn-default pull-left">Agregar</a><a id='delete_con' class="pull-right btn btn-default">Eliminar</a>
<br>
<br>
<br>

    <ul class="list-inline pull-right">
        <li><a href="#top"class="btn btn-default prev-step">Anterior</a></li>
        <li><a href="#top"class="btn btn-primary next-step">Siguiente</a></li>
    </ul>  
    
</div>
    




  </div>
   <script>
         $(document).ready(function(){
          var i=0;

         $("#add_con").click(function(){
          $('#tab_logiccon').append('<div id="addrp'+(i)+'"></div><div id="addrscriptvalidatecon'+(i)+'"></div><div id="addrscriptfrentecon'+(i)+'"></div><div id="addrscriptselectcon'+(i)+'"></div>  ');

          $('#addrp'+i).html("<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#proposalAcoordion' href='#collapseConsid'>Consideraciones "+(i+1)+"</a></h4></div><div id='collapseConsid' class='panel-collapse collapse in'><div class='panel-body'><div class='form-group' ><label for='validate-letras'>Parentesco:</label><div class='input-group'><select class='form-control' name='consideraciones["+i+"][parentesco]' id='consideraciones"+i+"parentesco' placeholder='Seleccione una opción' required><option value=''>Seleccione una opción</option><option value='Abuelo'>Abuelo/a</option><option value='Concubino'>Concubino/a</option><option value='Conyuge'>Cónyuge</option><option value='Cuniado'>Cuñado/a</option><option value='Hermano'>Hermano/a</option><option value='Hijo'>Hijo/a</option><option value='madre'>Madre</option><option value='padre'>Padre</option><option value='Nieto'>Nieto/a</option><option value='novio'>Novio/a</option><option value='Nuera'>Nuera</option><option value='Otro'>Otro</option><option value='Primo'>Primo/a</option><option value='Sobrino'>Sobrino/a</option><option value='Tio'>Tio/a</option><option value='Yerno'>Yerno</option></select><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div class='form-group'><label for='validate-text'>Enfermedad:</label><div class='input-group' ><input  type='text' class='form-control' name='consideraciones["+i+"][enfermedad]' id='consideraciones"+i+"enfermedad' placeholder='Ingrese solo letras' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div class='form-group'><label for='validate-letras'>Produce Incapacidad y/o Enfermedad cronica grave:</label><div class='input-group'><select  class='form-control' name='consideraciones["+i+"][incapacidad]' id='incapacidad"+i+"' onchange='imgcertificado("+i+", value)' placeholder='Seleccione una opción' required><option value=''>Seleccione una opción</option><option value='1'>Si</option><option value='0'>No</option></select><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div>         <div class='col-sm-offset-2 col-sm-7'>          <div style='display:none;' id='imagencertificadodiv"+i+"' class='form-group'></div></div>");
                                                                                           
          
      
          $('#addrscriptselectcon'+i).html("<script type='text/javascript'> $('#incapacidad"+i+"').on('change',function(){ var selected = $(this).val(); if (selected === '') { $('#imagencertificadodiv"+i+"').hide(); } else{ if(selected === '1') { $('#imagencertificadodiv"+i+"').show(); } else if(selected === '0') { $('#imagencertificadodiv"+i+"').hide(); $('#imagencertificadodiv"+i+"').html('');  } } });");

            $('#addrscriptvalidatecon'+i).html(" <script type='text/javascript'> $(document).ready(function() {         $('#consideraciones"+i+"parentesco, #consideraciones"+i+"enfermedad, #incapacidad"+i+", #imagencertificado"+i+"').on('change', function() {        var $form = $(this).closest('form'),        $group = $(this).closest('.input-group'),        $addon = $group.find('.input-group-addon'),        $icon = $addon.find('span'),        state = false;        if (!$group.data('validate')) {        state = $(this).val() ? true : false;        }else if ($group.data('validate') == 'email') {        state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())        }else if($group.data('validate') == 'phone') {        state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())        }else if ($group.data('validate') == 'length') {        state = $(this).val().length >= $group.data('length') ? true : false;        }else if ($group.data('validate') == 'number') {        state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());}        else if ($group.data('validate') == 'date') {        state = /^([0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])$/.test($(this).val())        }        else if ($group.data('validate') == 'letras') {        state = /^([a-zñA-ZÑ]+(\s*[a-zñA-ZÑ]*)*[a-zñA-ZÑ])+$/.test($(this).val())                               }        if (state) {        $addon.removeClass('danger');        $addon.addClass('success');        $icon.attr('class', 'glyphicon glyphicon-ok');        }else{        $addon.removeClass('success');        $addon.addClass('danger');        $icon.attr('class', 'glyphicon glyphicon-remove');        }        if ($form.find('.input-group-addon.danger').length == 0) {        $form.find('[type=submit]').prop('disabled', false);        }else{        $form.find('[type=submit]').prop('disabled', true);        }        });   $('#consideraciones"+i+"parentesco, #consideraciones"+i+"enfermedad, #incapacidad"+i+", #imagencertificado"+i+"').trigger('change');        }); " );

        $('#addrscriptfrentecon'+i).html('<script type="text/javascript"> $(document).on("click", "input[type='+"file"+']", function(evt) { let idd = this.id; document.getElementById(idd).onchange = function () { var reader = new FileReader(); reader.onload = function (e) { document.getElementById("list-" + idd).src = e.target.result; document.getElementById("list-" + idd+ "-1").style.display = "inline";   }; reader.readAsDataURL(this.files[0]); }; });');


         

          i++; 

      });

         $("#delete_con").click(function(){
           if(i>0){
         $("#addrp"+(i-1)).html('');
         i--;
         }
       });

    });
  </script>
  
  

</div>
<script >
  
  function imgcertificado(i, value) {
    
    if (value==='1') {
      $('#imagencertificadodiv'+i).html("<label class='label label-info' for='validate-number'>Imagen Certificado</label><div class='input-group'><input  type='file' id='imagencertificado"+i+"' name='consideraciones["+i+"][imagen]' accept='.jpg, .jpeg, .png' class='form-control' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-imagencertificado"+i+"-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-imagencertificado"+i+"' /></div></div>");

    $(document).ready(function() {

        $('#imagencertificado'+i).on('change', function() {
        
        var $form = $(this).closest('form'),
        $group = $(this).closest('.input-group'),
        $addon = $group.find('.input-group-addon'),
        $icon = $addon.find('span'),
        state = false;

        if (!$group.data('validate')) {
        state = $(this).val() ? true : false;
        }else if ($group.data('validate') == "number") {
        state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());}
        
        


        if (state) {
        $addon.removeClass('danger');
        $addon.addClass('success');
        $icon.attr('class', 'glyphicon glyphicon-ok');
        }else{
        $addon.removeClass('success');
        $addon.addClass('danger');
        $icon.attr('class', 'glyphicon glyphicon-remove');
        }

        if ($form.find('.input-group-addon.danger').length == 0) {
        $form.find('[type="submit"]').prop('disabled', false);
        }else{
        $form.find('[type="submit"]').prop('disabled', true);
        }
        });  //cierra div change key up

        $('#imagencertificadodiv'+i).trigger('change');
               
        });
    }
    else{
      $('#imagencertificadodiv'+i).html('');  
    }

    

    
  }


</script>

