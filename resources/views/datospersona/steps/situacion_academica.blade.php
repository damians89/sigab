  <div class="tab-pane" role="tabpanel" id="step2">
    <div class="container">
      <div class="row">
        <h3>1.2 - Situación Académica</h3>
      </div>

        <div class="col-sm-offset-2 col-sm-6">

          <div class="form-group">
            <label for="validate-letras">Condición:</label>
              <a href="#openModalCondicion" title="Ayuda">
                <span >
                  <i class="glyphicon glyphicon-info-sign"></i>
                </span>
              </a>
              <div class="input-group">
                <select class="form-control" name="cond" id="cond" placeholder="Seleccione una opción" required>
                  <option value="">Seleccione una opción</option>
                  @foreach($condicion as $condiciones)
                    <option value= {{$condiciones->nombre}}><p>{{ $condiciones->nombre }}</p></option>
                  @endforeach
                </select> 
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
                
              </div>

          </div>
        </div>

        <div id="openModalCondicion" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h2>Condición</h2>
                    <p><b>Ingresante:</b> Estudiante que se inscribió a la facultad en el año actual.</p>
                    <p><b>Nuevo:</b> Estudiante que ingreso en un año diferente al actual y se inscribe para solicitar el beneficio de la beca.</p>
                    <p><b>Renovante:</b> Estudiante que tenía la beca en el año anterior e intenta renovar el beneficio.</p>
                    <p><b>Condicional:</b> Estudiante que se encuentra fuera de estas tres categorías.</p>
                  </div>
              </div>

        <div class="col-sm-offset-3 col-sm-4">

          <div  id="ing1" class="form-group">
            
            </div>

            <div  id="ing2" class="form-group">
            
            </div>

            
        <div  id="nueren1" class="form-group">
          
        </div>

        <div  id="nueren2" class="form-group">
          
        </div>

        <div  id="condi1" class="form-group">
          
        </div>

      </div>

              <div class="col-sm-offset-2 col-sm-6">

          
          <div class="form-group">
              <label for="validate-letras">Carrera que cursa:</label>
                <div class="input-group" >
                
                <select class="form-control" name="carrera_cursa" id="carrera_cursa" placeholder="Seleccione una opción" required>
                <option value="">Seleccione una opción</option>
                @foreach($carrera as $carreras)
                <option value= {{$carreras->id}}><p>{{ $carreras->nombre }}</p></option>
                @endforeach
              </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>



          <div class="form-group">
              <label for="validate-letras">Año de Ingreso:</label>
                <div class="input-group">
                  <select  class="form-control" name="anioingreso" id="anioingreso" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023">2023</option><option value="2024">2024</option><option value="2025">2025</option><option value="2026">2026</option><option value="2027">2027</option><option value="2028">2028</option><option value="2029">2029</option><option value="2030">2030</option><option value="2031">2031</option><option value="2032">2032</option><option value="2033">2033</option><option value="2034">2034</option><option value="2035">2035</option><option value="2036">2036</option><option value="2037">2037</option><option value="2038">2038</option><option value="2039">2039</option><option value="2040">2040</option><option value="2041">2041</option><option value="2042">2042</option><option value="2043">2043</option><option value="2044">2044</option><option value="2045">2045</option><option value="2046">2046</option><option value="2047">2047</option><option value="2048">2048</option><option value="2049">2049</option><option value="2050">2050</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>
            
           <div class="form-group">
              <label for="validate-letras">Año de la carrera que cursa:</label>
                <div class="input-group">
                  <select value="{{ old('aniocursado') }}" class="form-control" name="aniocursado" id="aniocursado" placeholder="Seleccione una opción" required>
                    <option value="" selected>Seleccione una opción</option></select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>

          <div id="divcantmat"class="form-group">
            
          </div>

          <div  id="divpromedio" class="form-group">
          
        </div>             
          


          <ul class="list-inline pull-right">
              <li><a href="#top" class="btn btn-default prev-step">
                Anterior
              </a></li>
              <li><a href="#top" class="btn btn-primary next-step"> Siguiente</a></li>
          </ul>
        

        </div>


            
    </div>
  
</div>

<script language="javascript">
            $("#carrera_cursa").change(function (event) {
                
                $("#aniocursado").empty();
                $("#aniocursado").append("<option value='' selected>Seleccione una opción </option>");

                $("#cantmaterias").empty();
                $("#cantmaterias").append("<option value='' selected>Seleccione una opción </option>");

                $.get("carrera/"+event.target.value+"", function(response, state) {
                
                for(i=0; i<response[0].cant_materias; i++){
                
                $("#cantmaterias").append("<option value='"+(i+1)+"'>"+(i+1)+" </option>");
                }

                for(i=0; i<response[0].cant_anios; i++){
                
                $("#aniocursado").append("<option value='"+(i+1)+"'>"+(i+1)+" </option>");
                }

            });
        });
  </script> 




<script type="text/javascript">

$('#cond').on('change',function(){

var selected = $(this).val();

if (selected === "") {
  $('#ing1').html(""); 
  $('#ing2').html(""); 
  $('#nueren1').html(""); 
  $('#nueren2').html(""); 
  $('#condi1').html(""); 
  
  $('#divcantmat').html("");
  $('#divpromedio').html("");  
}
else if(selected === "Ingresante") {

  $('#nueren1').html(""); 
  $('#nueren2').html(""); 
  $('#condi1').html(""); 
  $('#divpromedio').html("");  

$('#ing1').html("<label class='label label-info' id='ing' for='validate-number'>Ingrese Constancia de inscripción a la Universidad</label><div class='input-group'><input  type='file' id='constancia' name='constancia' class='form-control' accept='.jpg, .jpeg, .png, .pdf' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-constancia-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-constancia' /></div>");

$('#ing2').html("<label class='label label-info' id='ing2' for='validate-number'>Ingrese Título Secundario con promedio general</label><div class='input-group'><input  type='file' id='certificado' name='certificado[]' class='form-control' accept='.jpg, .jpeg, .png, .pdf' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-certificado-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-certificado' /></div>");
  
$('#divpromedio').html("<label for='validate-number'>Promedio general:</label>  <div class='input-group' data-validate='number'> <input  type='number' min='0' max='10' class='form-control' name='promedio' id='promedio' placeholder='Ingrese solo números' required> <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div>"); 

 $(document).ready(function() {
        $('#certificado, #constancia, #promedio').on('change', function() {
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

        $('#certificado, #constancia, #promedio').trigger('change');

               
        });


}
else if((selected === "Renovante") || (selected === "Nuevo")  ) {


$('#ing1').html(""); 
$('#ing2').html(""); 
$('#condi1').html(""); 

$('#divpromedio').html(""); 

$('#nueren1').html("<label class='label label-info' id='ing' for='validate-number'>Ingrese Constancia de alumno regular</label><div class='input-group'><input  type='file' id='constancia' name='constancia' class='form-control' accept='.jpg, .jpeg, .png, .pdf' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-constancia-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-constancia' /></div>");

$('#nueren2').html("<label class='label label-info' id='res2' for='validate-number'>Ingrese Analítico de materias aprobadas</label><div class='input-group'><input  type='file' id='certificado' name='certificado[]' class='form-control' accept='.jpg, .jpeg, .png, .pdf' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-certificado-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-certificado' /></div>"); 

$('#divcantmat').html("<label for='validate-letras'>Cantidad de materias aprobadas:</label>  <div class='input-group'> <select  class='form-control' name='cantmaterias' id='cantmaterias' placeholder='Seleccione una opción' required> <option value='' selected>Seleccione una opción</option></select>  <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>   </div>");

$(document).ready(function() {
        $('#certificado, #constancia, #promedio, #cantmaterias').on('change', function() {
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

        $('#certificado, #constancia, #promedio, #cantmaterias').trigger('change');

               
        });
  
 
}
else if(selected === "Condicional") {

  $('#ing1').html(""); 
  $('#ing2').html(""); 
  $('#nueren1').html(""); 
  $('#nueren2').html(""); 
  $('#divcantmat').html("");
  $('#divpromedio').html(""); 
  $('#condi1').html("<label class='label label-info' for='validate-number'>Ingrese Constancia de alumno regular o </label><br><label class='label label-info' for='validate-number'>Constancia de inscripción a la Universidad</label>    <div class='input-group'><input  type='file' id='constancia' name='constancia' class='form-control' accept='.jpg, .jpeg, .png, .pdf' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span></div></div><div id='list-constancia-1' style='display:none;' class='form-group'><div class='input-group'><img class='thumb' id='list-constancia' /></div>");

  $(document).ready(function() {
        $('#certificado, #constancia, #promedio, #cantmaterias').on('change', function() {
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

        $('#certificado, #constancia, #promedio, #cantmaterias').trigger('change');

               
        });

}
else{
  $('#ing1').html(""); 
  $('#ing2').html(""); 
  $('#nueren1').html(""); 
  $('#nueren2').html(""); 
  $('#condi1').html(""); 
  
  $('#divcantmat').html("");
  $('#divpromedio').html(""); 
}
 

});
</script>


