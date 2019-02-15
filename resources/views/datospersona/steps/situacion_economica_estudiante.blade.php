<div class="tab-pane" role="tabpanel" id="step3">
  <div class="container">
    <div class="row">
      <h3>1.3 - Situación Económica del Estudiante</h3>
    </div>

    
    <div class="col-sm-offset-2 col-sm-6" >
      
        <div class="form-group">
              <label for="validate-letras">Trabaja:</label>
                <div class="input-group">
                  <select value="{{ old('trabaja') }}"  class="form-control" name="trabaja" id="trabaja" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value=1>Si</option><option value=0>No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>
        </div>
   
                  <div class="col-sm-offset-3 col-sm-4">

        <div  id="actividad" class="form-group">
              
          </div>
   
          
           <div  id="comprobanteIngresosact" >


          </div> <!-- cierra div comprobanteingreso -->
           <div  id="comprobanteIngresosaut" >


          </div> <!-- cierra div comprobanteingreso -->
           <div  id="comprobanteIngresosinf" >


          </div> <!-- cierra div comprobanteingreso -->

        </div>

            <div class="col-sm-offset-2 col-sm-6" >
        <div class="form-group">
              <label for="validate-letras">Tiene Becas:</label>
                <div class="input-group">
                  <select value="{{ old('beca') }}" class="form-control" name="beca" id="beca" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="1">Si</option><option value="2">No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>

          <div class="form-group">
              <label for="validate-letras">PROGRESAR:</label>
                <div class="input-group">
                  <select value="{{ old('progresar') }}" class="form-control" name="progresar" id="progresar" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="1">Si</option><option value="2">No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>

          <div class="form-group">
              <label for="validate-letras">Pasantías:</label>
                <div class="input-group">
                  <select value="{{ old('pasan') }}" class="form-control" name="pasan" id="pasan" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="1">Si</option><option value="2">No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>

          <div class="form-group">
              <label for="validate-letras">Asignación Universal por Hijo:</label>
              <a href="#openModalAsig" title="Ayuda">
                <span >
                  <i class="glyphicon glyphicon-info-sign"></i>
                </span>
              </a>
                <div class="input-group">
                  <select value="{{ old('asig') }}" class="form-control" name="asig" id="asig" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="1">Si</option><option value="2">No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>

          <div id="openModalAsig" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h2>Asignación Universal por Hijo</h2>
                    <p>Si el estudiante posee Asignación Universal por Hijo, seleccionar Si</p>
                    
                    
                  </div> 
              </div>

    
        


                      <div class="form-group">
              <label for="validate-letras">Otros Ingresos:</label>
                <div class="input-group">
                  <select value="{{ old('otrosing') }}" class="form-control" name="otrosing" id="otrosing" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value=1>Si</option><option value=0>No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>

        </div>

        <div class="col-sm-offset-3 col-sm-4">

          <div  id="otrosingdescrdiv" class="form-group">
            
            </div>

            <div  id="otrosingcantdiv" class="form-group">
                  
            </div>             
             
                
          </div>

        
        
        <div class="col-sm-offset-2 col-sm-6">
            
          
      
        <ul class="list-inline pull-right">
          <li><a href="#top" class="btn btn-default prev-step">Anterior</a></li>
          <li><a href="#top" class="btn btn-primary next-step">Siguiente</a></li>
        </ul>
    </div>
  </div>
</div>


<script type="text/javascript">

$('#trabaja').on('change',function()
{
var selected = $(this).val();

if (selected === "") {
$('#actividad').html(""); 

$('#comprobanteIngresosact').html(""); 
$('#comprobanteIngresosaut').html(""); 
$('#comprobanteIngresosinf').html("");

}
else{

if(selected === "1") {

$('#actividad').html("<label class='label label-info' for='validate-letras'>Actividad laboral</label> <div class='input-group'> <select class='form-control' onchange='comprobante(value)' name='actlab' id='actlab' placeholder='Seleccione una opción' required><option value=''>Seleccione una opción</option> <option value='activos'>Empleados Activos o Jubilados</option><option value='monotri'>Autónomos y Monotributistas</option>  <option value='informal'>Trabajadores Informales</option></select><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div>");

$(document).ready(function() {
        $('#actlab').on('change', function() {
        var $form = $(this).closest('form'),
        $group = $(this).closest('.input-group'),
        $addon = $group.find('.input-group-addon'),
        $icon = $addon.find('span'),
        state = false;

        

        if (!$group.data('validate')) {
        state = $(this).val() ? true : false;
        }else if ($group.data('validate') == "email") {
        state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())
        }else if($group.data('validate') == 'phone') {
        state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())
        }else if ($group.data('validate') == "length") {
        state = $(this).val().length >= $group.data('length') ? true : false;
        }else if ($group.data('validate') == "number") {
        state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());}
        else if ($group.data('validate') == "date") {
        state = /^([0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])$/.test($(this).val())
        }
        else if ($group.data('validate') == "letras") {
        state = /^([a-zñA-ZÑ]+(\s*[a-zñA-ZÑ]*)*[a-zñA-ZÑ])+$/.test($(this).val())
                }
        
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
        });

        $('#actlab').trigger('change');

               
        }); 
 
 
}
else {
$('#actividad').html(""); 
$('#comprobanteIngresosact').html(""); 
$('#comprobanteIngresosaut').html(""); 
$('#comprobanteIngresosinf').html("");
}

}

});
</script>


<script>
  function comprobante(value) {
  if(value === "monotri") {
      $('#recibo').hide(); 
      $('#jurada').hide();
      $('#afip').show();
      $('#comprobanteIngresosact').html(""); 
      $('#comprobanteIngresosinf').html("");
      $('#comprobanteIngresosaut').html("<div class='form-group'><label  id='jurada' for='validate-number'>Comprobante de AFIP/pago monotributo</label><div> <label class='label label-info'>Comprobante</label> </div><div class='input-group'><input type='file' id='comping1' name='comping1' accept='.jpg, .jpeg, .png' class='form-control' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-comping1-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-comping1' />              </div></div><div  id='sueldodiv' class='form-group'> <label class='label label-info' for='validate-number'>Ingresos Propios (Mensuales) $</label>   <div class='input-group' data-validate='number'>            <input  type='number' min='0' class='form-control' name='sueldo' id='sueldo' placeholder='Ingrese solo números' required>  <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>     </div>      </div>"); 
     
 $(document).ready(function() {
        $('#sueldo, #comping1, #comping2, #comping3').on('change', function() {
        var $form = $(this).closest('form'),
        $group = $(this).closest('.input-group'),
        $addon = $group.find('.input-group-addon'),
        $icon = $addon.find('span'),
        state = false;

        

        if (!$group.data('validate')) {
        state = $(this).val() ? true : false;
        }else if ($group.data('validate') == "email") {
        state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())
        }else if($group.data('validate') == 'phone') {
        state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())
        }else if ($group.data('validate') == "length") {
        state = $(this).val().length >= $group.data('length') ? true : false;
        }else if ($group.data('validate') == "number") {
        state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());}
        else if ($group.data('validate') == "date") {
        state = /^([0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])$/.test($(this).val())
        }
        else if ($group.data('validate') == "letras") {
        state = /^([a-zñA-ZÑ]+(\s*[a-zñA-ZÑ]*)*[a-zñA-ZÑ])+$/.test($(this).val())
                }
        
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
        });

        $('#sueldo, #comping1, #comping2, #comping3').trigger('change');

               
        });
  
}
else if(value === "informal"){
  $('#recibo').hide(); 
  $('#afip').hide(); 
  $('#jurada').show();
  $('#comprobanteIngresosact').html(""); 
  $('#comprobanteIngresosaut').html("");
  $('#comprobanteIngresosinf').html("<div class='form-group'><label  id='jurada' for='validate-number'>Declaración jurada especificando actividad laboral e ingresos mensuales:</label><div> <label class='label label-info'>Comprobante</label> </div><div class='input-group'><input type='file' id='comping1' name='comping1' accept='.jpg, .jpeg, .png' class='form-control' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-comping1-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-comping1' />              </div></div><div  id='sueldodiv' class='form-group'> <label class='label label-info' for='validate-number'>Ingresos Propios (Mensuales) $</label>   <div class='input-group' data-validate='number'>            <input  type='number' min='0' class='form-control' name='sueldo' id='sueldo' placeholder='Ingrese solo números' required>  <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>     </div>      </div>"); 
 
 $(document).ready(function() {
        $('#sueldo, #comping1, #comping2, #comping3').on('change', function() {
        var $form = $(this).closest('form'),
        $group = $(this).closest('.input-group'),
        $addon = $group.find('.input-group-addon'),
        $icon = $addon.find('span'),
        state = false;

        

        if (!$group.data('validate')) {
        state = $(this).val() ? true : false;
        }else if ($group.data('validate') == "email") {
        state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())
        }else if($group.data('validate') == 'phone') {
        state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())
        }else if ($group.data('validate') == "length") {
        state = $(this).val().length >= $group.data('length') ? true : false;
        }else if ($group.data('validate') == "number") {
        state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());}
        else if ($group.data('validate') == "date") {
        state = /^([0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])$/.test($(this).val())
        }
        else if ($group.data('validate') == "letras") {
        state = /^([a-zñA-ZÑ]+(\s*[a-zñA-ZÑ]*)*[a-zñA-ZÑ])+$/.test($(this).val())
                }
        
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
        });

        $('#sueldo, #comping1, #comping2, #comping3').trigger('change');

               
        });
  }
else if(value === "activos") {
  $('#afip').hide(); 
  $('#jurada').hide();
  $('#recibo').show(); 
  $('#comprobanteIngresosact').html("<div class='form-group'><label  id='recibo' for='validate-number'>Últimos tres recibos de sueldo</label><div> <label class='label label-info'>Comprobante</label> </div><div class='input-group'><input type='file' id='comping1' name='comping1' accept='.jpg, .jpeg, .png' class='form-control' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-comping1-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-comping1' />              </div></div><div  id='comprobanteIngresos2' class='form-group'><div> <label class='label label-info'>Comprobante</label> </div><div class='input-group'><input  type='file' id='comping2' name='comping2'  accept='.jpg, .jpeg, .png' class='form-control'><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-comping2-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-comping2' />              </div></div><div  id='comprobanteIngresos3' class='form-group'><div> <label class='label label-info'>Comprobante</label> </div><div  class='input-group'><input type='file' id='comping3' name='comping3'  accept='.jpg, .jpeg, .png' class='form-control' ><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-comping3-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-comping3' />             </div></div><div  id='sueldodiv' class='form-group'> <label class='label label-info' for='validate-number'>Ingresos Propios (Mensuales) $</label>   <div class='input-group' data-validate='number'>            <input  type='number' min='0' class='form-control' name='sueldo' id='sueldo' placeholder='Ingrese solo números' required>  <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>     </div>      </div>");
   $(document).ready(function() {
        $('#sueldo, #comping1, #comping2, #comping3').on('change', function() {
        var $form = $(this).closest('form'),
        $group = $(this).closest('.input-group'),
        $addon = $group.find('.input-group-addon'),
        $icon = $addon.find('span'),
        state = false;

        

        if (!$group.data('validate')) {
        state = $(this).val() ? true : false;
        }else if ($group.data('validate') == "email") {
        state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())
        }else if($group.data('validate') == 'phone') {
        state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())
        }else if ($group.data('validate') == "length") {
        state = $(this).val().length >= $group.data('length') ? true : false;
        }else if ($group.data('validate') == "number") {
        state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());}
        else if ($group.data('validate') == "date") {
        state = /^([0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])$/.test($(this).val())
        }
        else if ($group.data('validate') == "letras") {
        state = /^([a-zñA-ZÑ]+(\s*[a-zñA-ZÑ]*)*[a-zñA-ZÑ])+$/.test($(this).val())
                }
        
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
        });

        $('#sueldo, #comping1, #comping2, #comping3').trigger('change');

               
        });
}

else{
  $('#comprobanteIngresosact').html(""); 
  $('#comprobanteIngresosaut').html("");
  $('#comprobanteIngresosinf').html("");
  }
}
</script>


<script type="text/javascript">

$('#otrosing').on('change',function()
{
var selected = $(this).val();

if (selected === "") {
$('#otrosingdescrdiv').html(""); 
$('#otrosingcantdiv').html(""); 

}
else if(selected === "1") {



$('#otrosingdescrdiv').html("<div class='form-group'>  <label class='label label-info' for='validate-letras'>Descripción</label><a href='#openModalOtrosing' title='Ayuda'>  <span ><i class='glyphicon glyphicon-info-sign'></i> </span>  </a> <div class='input-group'>  <textarea  class='form-control' name='otrosingdescr' id='otrosingdescr' placeholder='Ingrese solo letras' required></textarea> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>  </div> </div><div id='openModalOtrosing' class='modalDialog'><div> <a href='#close' title='Close' class='close'>X</a>  <h2>Descripción otros ingresos</h2> <p>Ingrese una breve descripción personal de otros ingresos que posea</p> </div> </div>"); 

$('#otrosingcantdiv').html("<label for='validate-number' class='label label-info'>Monto $</label>                <div class='input-group'>                <input  type='number' class='form-control' min='0' name='otrosingcant' id='otrosingcant' placeholder='Ingrese solo números'>  <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>                </div>"); 

$(document).ready(function() {

        $('#otrosingdescr, #otrosingcant').on('change', function() {
        
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

        $('#otrosingdescr, #otrosingcant').trigger('change');
               
        });

}
else if(selected === "0") {
$('#otrosingcantdiv').html(""); 
$('#otrosingdescrdiv').html(""); 

}


});
</script>