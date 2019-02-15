<div class="tab-pane" role="tabpanel" id="step6">
    <div class="container">
      <div class="row">
        <h3>1.6 – Otras Personas que Conforman el Grupo Familiar</h3>
      </div>

        
         <div class="col-sm-offset-2 col-sm-6" >

        
        <div id="proposalAccordion">
          
          <div id="tab_logic"> 

      
       
      
    </div>

    </div>  <!--  cierra tablogic -->

    </div> <!--  cierra div according -->

   <div class="col-sm-offset-2 col-sm-6" >

<a id="add_div" class="btn btn-default pull-left">Agregar</a><a id='delete_div' class="pull-right btn btn-default">Eliminar</a>

<br>
<br>
<br>


<ul class="list-inline pull-right">
        <li><a href="#top" class="btn btn-default prev-step">Anterior</a></li>
        <li><a href="#top" class="btn btn-primary next-step">Siguiente</a></li>
    </ul>

</div>


    <!-- </div>  cierra div col-6 -->
      
 

  
  </div>

  
    

</div>




<!-- aca comienza script q crea todo de nuevo -->

<script>
         $(document).ready(function(){
          
          var i=0;
          
         $("#add_div").click(function(){

          $('#tab_logic').append('<div id="addr'+(i)+'"></div><div id="addrscriptselect'+(i)+'"></div><div id="addrscriptotroselect'+(i)+'"></div><div id="addrscriptvalidate'+(i)+'"></div> <div id="addrscriptfrente'+(i)+'"></div> '); 

          $('#addr'+i).html("<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#proposalAcoordion"+(i+1)+"' href='#collapseContact"+(i+1)+"'>Familiar "+(i+1)+"</a> </h4>            </div><div id='collapseContact"+(i+1)+"' class='panel-collapse collapse in'><div class='panel-body'><div class='form-group' ><label for='validate-letras'>Parentesco:</label><div class='input-group'>  <select class='form-control' name='familiar["+i+"][parentesco]' id='familiar"+i+"parentesco' placeholder='Seleccione una opción' required> <option value=''>Seleccione una opción</option><option value='Abuelo'>Abuelo/a</option><option value='Concubino'>Concubino/a</option>  <option value='Conyuge'>Cónyuge</option> <option value='Cuniado'>Cuñado/a</option>  <option value='Hermano'>Hermano/a</option>     <option value='Hijo'>Hijo/a</option>  <option value='madre'>Madre</option>   <option value='padre'>Padre</option>     <option value='Nieto'>Nieto/a</option>   <option value='novio'>Novio/a</option>   <option value='Nuera'>Nuera</option> <option value='Otro'>Otro</option> <option value='Primo'>Primo/a</option>  <option value='Sobrino'>Sobrino/a</option> <option value='Tio'>Tio/a</option> <option value='Yerno'>Yerno</option>  </select>    <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div> </div>  <div class='form-group'> <label for='validate-text'>Apellidos y Nombres:</label>   <div class='input-group' >            <input  type='text' class='form-control' name='familiar["+i+"][apeynom]' id='familiar"+i+"apeynom' placeholder='Ingrese solo letras' required>            <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>        </div>  </div> <div class='form-group'> <label for='validate-number'>DNI:</label>            <div class='input-group' data-validate='number'>  <input  type='text' class='form-control' name='familiar["+i+"][dnifam]' id='familiar"+i+"dnifam' placeholder='Ingrese solo números' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div>  </div><div class='form-group'> <label for='validate-number'>Ingresa fotos de frente y dorso del DNI</label>   </div><div class='form-group'>  <label class='label label-info' for='validate-number'>  Solo frente</label>          <div class='input-group'>   <input type='file' id='familiar"+i+"frente' name='familiar["+i+"][frente]' class='form-control' accept='.jpg, .jpeg, .png' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div>  </div><div id='list-familiar"+i+"frente-1' style='display:none;' class='form-group'> <div class='input-group'><img class='thumb' id='list-familiar"+i+"frente' /> </div></div><div class='form-group'>          <label class='label label-info' for='validate-number'>  Solo dorso</label> <div class='input-group'> <input type='file' id='familiar"+i+"dorso' name='familiar["+i+"][dorso]' class='form-control' accept='.jpg, .jpeg, .png' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div>    </div><div id='list-familiar"+i+"dorso-1' style='display:none;' class='form-group'>    <div class='input-group'>  <img class='thumb' id='list-familiar"+i+"dorso'></output> </div></div> <div class='form-group'>   <label for='validate-number'>Edad:</label> <div class='input-group' data-validate='number'>  <input   type='text' class='form-control' name='familiar["+i+"][edadfam]' id='familiar"+i+"edadfam' placeholder='Ingrese solo números' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div>  </div>   <div class='form-group'> <label for='validate-text'>Ocupación:</label> <div class='input-group' > <input  type='text' class='form-control' name='familiar["+i+"][ocupacionfam]' id='familiar"+i+"ocupacionfam' placeholder='Ingrese solo letras' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>  </div></div>  <div class='form-group'> <label for='validate-text'>Trabaja:</label> <div class='input-group'><select class='form-control' onchange='famtrabaja("+i+", value)' name='familiar["+i+"][trabaja]' id='familiartrabaja"+i+"' placeholder='Seleccione una opción' required>  <option value=''>Seleccione una opción</option><option value='1'>Si</option><option value='0'>No</option>                </select>    <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>       </div></div> <div class='col-sm-offset-2 col-sm-8'><div style='display:none;' id='actlabfamdiv"+i+"' class='form-group'>  </div> </div>  <div class='form-group'><label for='validate-number'>Certificación Negativa ANSES:</label> <a href='#openModalAnsesfam' title='Ayuda'><span > <i class='glyphicon glyphicon-info-sign'></i></span></a><div class='input-group'> <input type='file' id='familiar"+i+"ansesfam' name='familiar["+i+"][ansesfam]' accept='.jpg, .jpeg, .png, .pdf' class='form-control' required>   <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div> </div><div id='list-familiar"+i+"ansesfam-1' style='display:none;' class='form-group'><div class='input-group'> <img class='thumb' id='list-familiar"+i+"ansesfam'/></div></div></div></div>  </div></div>  <div id='openModalAnsesfam' class='modalDialog'> <div> <a href='#close' title='Close' class='close'>X</a>  <h2>Certificación Negativa ANSES</h2> <p>Puede obtener la Certificación Negativa ANSES desde el siguiente link:</p>  <a href='https://www.anses.gob.ar/consultas/certificacion-negativa' target='_blank'>https://www.anses.gob.ar/consultas/certificacion-negativa</a>  </div>              </div> <script type='text/javascript'> var toogle = (function () {    return {        init: function(buttonId, accordionId) {    var that = this;            $(buttonId).click(function() {   that.togglePanels(accordionId, $(buttonId));   });   }, togglePanels : function(accordionId, buttonContainer){ var onButton = $(buttonContainer).children('.onToggle').eq(0); var offButton = $(buttonContainer).children('.offToggle').eq(0); if (onButton.hasClass('hideToggleButton')){        this.openAllPanels(accordionId);  offButton.addClass('hideToggleButton');        offButton.removeClass('showToggleButton');        onButton.removeClass('hideToggleButton');       onButton.addClass('showToggleButton');      }      else{        this.closeAllPanels(accordionId);        onButton.addClass('hideToggleButton');        onButton.removeClass('showToggleButton');        offButton.addClass('showToggleButton');        offButton.removeClass('hideToggleButton');      }              },        openAllPanels : function(aId) {        $(aId + ' .panel-collapse:not(.in)').collapse('show');    },    closeAllPanels : function(aId) {      $(aId + ' .panel-collapse.in').collapse('hide');    }   }}) (); $(function () {    toogle.init('#toogleButton', '#proposalAccordion"+(i+1)+"');}); ");

      $('#addrscriptselect'+i).html(" <script type='text/javascript'> $('#familiartrabaja"+i+"').on('change',function(){var selected = $(this).val();$('#comprobanteIngresosfam"+i+"').hide(); if (selected === '') {$('#actlabfamdiv"+i+"').hide();$('#ingresosfamdiv"+i+"').hide();$('#comprobanteIngresosfam"+i+"').hide();} else{ if(selected === '1') {$('#comprobanteIngresosfam"+i+"').show();$('#actlabfamdiv"+i+"').show(); $('#ingresosfamdiv"+i+"').show(); } else if(selected === '0') {$('#comprobanteIngresosfam"+i+"').hide();$('#actlabfamdiv"+i+"').hide(); $('#ingresosfamdiv"+i+"').hide();}}}); ");

        $('#addrscriptotroselect'+i).html(" <script type='text/javascript'> $('#familiaractlab"+i+"').on('change',function(){ var selected = $(this).val();  if (selected === '') { $('#recibofam"+i+"').hide();   $('#afipfam"+i+"').hide();    $('#juradafam"+i+"').hide(); $('#imag"+(i+1)+"1').hide();  $('#imag"+(i+1)+"2').hide(); $('#imag"+(i+1)+"3').hide(); }  else{ if(selected === 'monotrifam"+i+"') {  $('#recibofam"+i+"').hide(); $('#juradafam"+i+"').hide(); $('#afipfam"+i+"').show(); $('#imag"+(i+1)+"1').show();  $('#imag"+(i+1)+"2').hide(); $('#imag"+(i+1)+"3').hide(); } else if(selected === 'informalfam"+i+"') { $('#recibofam"+i+"').hide();  $('#afipfam"+i+"').hide();             $('#juradafam"+i+"').show();   $('#imag"+(i+1)+"1').show();       $('#imag"+(i+1)+"2').hide();     $('#imag"+(i+1)+"3').hide();    }          else if(selected === 'activosfam"+i+"') {         $('#afipfam"+i+"').hide();             $('#juradafam"+i+"').hide();            $('#recibofam"+i+"').show();             $('#imag"+(i+1)+"1').show();            $('#imag"+(i+1)+"2').show();            $('#imag"+(i+1)+"3').show();          }          }          });");

       $('#addrscriptvalidate'+i).html(" <script type='text/javascript'> $(document).ready(function() {         $('#familiar"+i+"comping1, #familiar"+i+"comping2, #familiar"+i+"comping3, #familiar"+i+"ingresosfam, #familiar"+i+"ansesfam, familiar"+i+"parentesco, #familiar"+i+"comping1, #familiar"+i+"comping2, #familiar"+i+"comping3, #familiar"+i+"ingresosfam, #familiar"+i+"ansesfam, #familiar"+i+"parentesco, #familiar"+i+"ocupacionfam, #familiar"+i+"frente, #familiar"+i+"dorso, #familiar"+i+"dnifam, #familiar"+i+"apeynom, #familiar"+i+"edadfam, #familiartrabaja"+i+", #familiaractlab"+i+", #familiar"+i+"ansesfam').on('change', function() {        var $form = $(this).closest('form'),        $group = $(this).closest('.input-group'),        $addon = $group.find('.input-group-addon'),        $icon = $addon.find('span'),        state = false;        if (!$group.data('validate')) {        state = $(this).val() ? true : false;        }else if ($group.data('validate') == 'email') {        state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())        }else if($group.data('validate') == 'phone') {        state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())        }else if ($group.data('validate') == 'length') {        state = $(this).val().length >= $group.data('length') ? true : false;        }else if ($group.data('validate') == 'number') {        state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());}        else if ($group.data('validate') == 'date') {        state = /^([0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])$/.test($(this).val())        }        else if ($group.data('validate') == 'letras') {        state = /^([a-zñA-ZÑ]+(\s*[a-zñA-ZÑ]*)*[a-zñA-ZÑ])+$/.test($(this).val())                               }        if (state) {        $addon.removeClass('danger');        $addon.addClass('success');        $icon.attr('class', 'glyphicon glyphicon-ok');        }else{        $addon.removeClass('success');        $addon.addClass('danger');        $icon.attr('class', 'glyphicon glyphicon-remove');        }        if ($form.find('.input-group-addon.danger').length == 0) {        $form.find('[type=submit]').prop('disabled', false);        }else{        $form.find('[type=submit]').prop('disabled', true);        }        });   $('#familiar"+i+"comping1, #familiar"+i+"comping2, #familiar"+i+"comping3, #familiar"+i+"ingresosfam, #familiar"+i+"ansesfam, familiar"+i+"parentesco, #familiar"+i+"comping1, #familiar"+i+"comping2, #familiar"+i+"comping3, #familiar"+i+"ingresosfam, #familiar"+i+"ansesfam, #familiar"+i+"parentesco, #familiar"+i+"ocupacionfam, #list-familiar"+i+"frente, #list-familiar"+i+"dorso, #familiar"+i+"dnifam, #familiar"+i+"apeynom, #familiar"+i+"edadfam, #familiartrabaja"+i+", #familiaractlab"+i+", #familiar"+i+"ansesfam').trigger('change');        }); " ); 
        

          
        $('#addrscriptfrente'+i).html('<script type="text/javascript"> $(document).on("click", "input[type='+"file"+']", function(evt) { let idd = this.id; document.getElementById(idd).onchange = function () { var reader = new FileReader(); reader.onload = function (e) { document.getElementById("list-" + idd).src = e.target.result;             document.getElementById("list-" + idd+ "-1").style.display = "inline";   }; reader.readAsDataURL(this.files[0]); }; });');



          i++;

            });    
          
          $("#delete_div").click(function(){
           if(i>0){
         $("#addr"+(i-1)).html('');
         $("#addrscriptselect"+(i-1)).html('');
         $("#addrscriptotroselect"+(i-1)).html('');
         $("#addrscriptvalidate"+(i-1)).html('');
         $("#addrscriptfrente"+(i-1)).html('');
         

         i--;
         }
      
      
      


  
       });
    });
</script>


<script >
  
  function famtrabaja(i, value) {
    if (value==='1') {
      $('#actlabfamdiv'+i).html("<label class='label label-info' for='validate-text'>Actividad laboral</label>   <div class='input-group'>  <select class='form-control' onchange='compfam("+i+", value)' name='familiar["+i+"][actlab]' id='familiaractlab"+i+"' placeholder='Seleccione una opción' required> <option value=''>Seleccione una opción</option><option value='activosfam"+i+"'>Empleados Activos o Jubilados</option>  <option value='monotrifam"+i+"'>Autónomos y Monotributistas</option> <option value='informalfam"+i+"'>Trabajadores Informales</option></select><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>  </div> </div> <div style='display:none;' id='comprobanteIngresosfam"+i+"' >  ");

      $(document).ready(function() {

        $('#familiaractlab'+i).on('change', function() {
        
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

        $('#familiaractlab'+i).trigger('change');
               
        });
    }
    else{
      $('#actlabfamdiv'+i).html("");
    }
  }

</script>

<script >
  function compfam(i, value) {
    
    $('#comprobanteIngresosfam'+i).html("");
    if (value==="activosfam"+i) {
      $('#comprobanteIngresosfam'+i).html("<br><label  id='recibofam"+i+"' for='validate-number'>Últimos tres recibos de sueldo</label><div id='imag"+(i+1)+"1' ><label class='label label-info' for='validate-number'>Comprobante</label>   <div class='input-group'>  <input  type='file' id='familiar"+i+"comping1' name='familiar["+i+"][comping1]' accept='.jpg, .jpeg, .png' class='form-control' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div> </div><div id='list-familiar"+i+"comping1-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-familiar"+i+"comping1' />   </div> </div></div><div  id='imag"+(i+1)+"2' > <label for='validate-number' class='label label-info'>Comprobante</label> <div class='input-group'><input  type='file' id='familiar"+i+"comping2' name='familiar["+i+"][comping2]' accept='.jpg, .jpeg, .png' class='form-control' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>      </div></div><div style='display:none;' id='list-familiar"+i+"comping2-1'  class='form-group'><div class='input-group'> <img class='thumb' id='list-familiar"+i+"comping2' /></div></div><div  id='imag"+(i+1)+"3' ><label for='validate-number' class='label label-info'>Comprobante</label><div class='input-group'>  <input  type='file' id='familiar"+i+"comping3' name='familiar["+i+"][comping3]' accept='.jpg, .jpeg, .png'  class='form-control' required>  <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div style='display:none;' id='list-familiar"+i+"comping3-1'  class='form-group'><div class='input-group'><img class='thumb' id='list-familiar"+i+"comping3' /></div> </div></div> <div  id='ingresosfamdiv"+i+"' class='form-group'> <label for='validate-number' class='label label-info'>Ingresos</label>   <div class='input-group' data-validate='number'><input   type='text' class='form-control' name='familiar["+i+"][ingresosfam]' id='familiar"+i+"ingresosfam' placeholder='Ingrese solo números' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>  </div>"); 

      $(document).ready(function() {

        $("#familiar"+i+"comping3, #familiar"+i+"comping2, #familiar"+i+"comping1, #familiar"+i+"ingresosfam").on('change', function() {
        
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

        $("#familiar"+i+"comping3, #familiar"+i+"comping2, #familiar"+i+"comping1, #familiar"+i+"ingresosfam").trigger('change');
               
        });


    }
    else if (value==="informalfam"+i) {
      $('#comprobanteIngresosfam'+i).html("<br><label  id='recibofam"+i+"' for='validate-number'>Declaración jurada especificando actividad laboral e ingresos mensuales</label><div id='imag"+(i+1)+"1' ><label class='label label-info' for='validate-number'>Comprobante</label>   <div class='input-group'>  <input  type='file' id='familiar"+i+"comping1' name='familiar["+i+"][comping1]' accept='.jpg, .jpeg, .png' class='form-control' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div> </div><div id='list-familiar"+i+"comping1-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-familiar"+i+"comping1' />   </div> </div></div><div  id='ingresosfamdiv"+i+"' class='form-group'> <label class='label label-info' for='validate-number'>Ingresos</label>   <div class='input-group' data-validate='number'><input   type='text' class='form-control' name='familiar["+i+"][ingresosfam]' id='familiar"+i+"ingresosfam' placeholder='Ingrese solo números' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>  </div>"); 

      $(document).ready(function() {

        $("#familiar"+i+"comping3, #familiar"+i+"comping2, #familiar"+i+"comping1, #familiar"+i+"ingresosfam").on('change', function() {
        
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

        $("#familiar"+i+"comping3, #familiar"+i+"comping2, #familiar"+i+"comping1, #familiar"+i+"ingresosfam").trigger('change');
               
        });
    }
    else if (value==="monotrifam"+i) {
      $('#comprobanteIngresosfam'+i).html("<br><label  id='recibofam"+i+"' for='validate-number'>Comprobante de AFIP/pago monotributo</label><div id='imag"+(i+1)+"1' ><label class='label label-info' for='validate-number'>Comprobante</label>   <div class='input-group'>  <input  type='file' id='familiar"+i+"comping1' name='familiar["+i+"][comping1]' accept='.jpg, .jpeg, .png' class='form-control' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div> </div><div id='list-familiar"+i+"comping1-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-familiar"+i+"comping1' />   </div> </div></div><div  id='ingresosfamdiv"+i+"' class='form-group'> <label class='label label-info' for='validate-number'>Ingresos</label>   <div class='input-group' data-validate='number'><input   type='text' class='form-control' name='familiar["+i+"][ingresosfam]' id='familiar"+i+"ingresosfam' placeholder='Ingrese solo números' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>  </div>"); 

      $(document).ready(function() {

        $("#familiar"+i+"comping3, #familiar"+i+"comping2, #familiar"+i+"comping1, #familiar"+i+"ingresosfam").on('change', function() {
        
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

        $("#familiar"+i+"comping3, #familiar"+i+"comping2, #familiar"+i+"comping1, #familiar"+i+"ingresosfam").trigger('change');
               
        });
    }
    else {
      $('#comprobanteIngresosfam'+i).html("");
    }


 



  }


</script>