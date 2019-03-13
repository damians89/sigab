
<div class="tab-content">
  <div class="tab-pane active" role="tabpanel" id="step1">
    <div class="container">
      <div class="row">
        <h3>1.1 - Datos Personales del Estudiante</h3>
      </div>
      
        <div class="col-sm-offset-2 col-sm-6">
          
              <input type="hidden" name="user_id" id="user_id" value={{ $user->id }}>


        <div class="form-group">
            <label for="validate-letras">Apellidos:</label>
            <div class="input-group" data-validate="letras">
                <input readonly value="{{ $user->apellido }}" type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingrese solo letras" required>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
        </div>    
    

        <div class="form-group">
        <label for="validate-letras">Nombres:</label>
        <div class="input-group" data-validate="letras">
        <input readonly value="{{ $user->name  }}" type="text" class="form-control" name="nombre" id="nombres" placeholder="Ingrese solo letras" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>

        </div>
        

        <div class="form-group">
        <label for="validate-number">DNI/Pasaporte N°:</label>
        <div class="input-group" data-validate="number">
        <input readonly value="{{ $user->dni }}" type="text" class="form-control" name="dni" id="dni" placeholder="Ingrese solo números" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        </div>             
        

        <div class="form-group">
          <label for="validate-number">Ingresa fotos de frente y dorso del DNI</label>
        
        </div>
        
        

        <div class="form-group">
          <label for="validate-number" class="label label-info">  Solo frente</label>
          <div class="input-group">
            <input  type="file" id="imagen_frente" name="imagen_frente" class="form-control" accept=".jpg, .jpeg, .png" required>
            <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
          </div>
        </div>
          <div id='list-imagen_frente-1' style='display:none;' class='form-group'>
        <div class="input-group">
            <img class="thumb" id="list-imagen_frente" />
        </div>
        </div>

        <div class="form-group">
          <label for="validate-number" class="label label-info">  Solo dorso</label>
          <div class="input-group">
            <input type="file" id="imagen_dorso" name="imagen_dorso" class="form-control" accept=".jpg, .jpeg, .png" required>
            <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
          </div>
        </div>
        <div id='list-imagen_dorso-1' style='display:none;' class='form-group'>
        <div class="input-group">
            <img class="thumb" id="list-imagen_dorso" />
        </div>
        </div>


        <div class="form-group">
          <label for="validate-number">Certificación Negativa ANSES:</label>
          <a href="#openModalAnses" title="Ayuda">
                <span >
                  <i class="glyphicon glyphicon-info-sign"></i>
                </span>
              </a>
          <div class="input-group">
            <input type="file" id="anses" name="anses" class="form-control" accept=".jpg, .jpeg, .png, .pdf" required>
            <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
          </div>
        </div>
        <div id='list-anses-1' style='display:none;' class='form-group'>
        <div class="input-group">
            <img class="thumb" id="list-anses" />
        </div>
        </div>

        <div id="openModalAnses" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h2>Certificación Negativa ANSES</h2>
                    <p>Puede obtener la Certificación Negativa ANSES desde el siguiente link:</p>
                    <a href="https://www.anses.gob.ar/consultas/certificacion-negativa" target="_blank">https://www.anses.gob.ar/consultas/certificacion-negativa</a>

                  </div>
              </div>




        <div class="form-group">
        <label for="validate-number">CUIL N°:</label>
        <div class="input-group" data-validate="number">
        <input value="{{ old('cuil') }}"  type="text" class="form-control" name="cuil" id="cuil" placeholder="Ingrese solo números" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        </div>             
        
                          

        <div class="form-group">
          <label for="validate-select">Estado Civil:</label>
            <div class="input-group">
                <select  class="form-control" name="estcivil" id="estcivil" placeholder="Seleccione una opción" required>
                  <option value="">Seleccione una opción</option>
                  <option value="soltero">Soltero</option>
                  <option value="casado">Casado</option>
                  <option value="divorciado">Divorciado</option>
                  <option value="viudo">Viudo</option>
                </select>
              <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
        </div> 



        <div class="form-group">
        <label for="validate-date">Fecha de nacimiento:</label>
        <div class="input-group" data-validate="date">
        <input value="{{ old('cumple') }}" type="date" class="form-control" name="cumple" id="cumple" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        </div>

        <div class="form-group">
        <label for="validate-text">Domicilio que figura en el DNI:</label>
        <div class="input-group">
        <input value="{{ old('domi') }}" type="text" class="form-control" name="domi" id="domi" placeholder="Ingrese letras y números" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        </div>

        <div class="form-group">
          <label for="validate-select">Provincia:</label>
            <div class="input-group">
{!! Form::select('provincia', $provincia, 9, ['id' => 'provincia','class'=>'form-control','required']) !!}
                         <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
        </div> 

  <div class="form-group">
              <label for="validate-letras">Localidad:</label>
                <div class="input-group">
                  <select value="{{ old('localidad') }}" class="form-control" name="localidad" id="localidad" placeholder="Seleccione una opción" required>
                    <option value="" selected>Seleccione una opción</option></select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>


        <div class="form-group">
        <label for="validate-number">Código Postal:</label>
        <div class="input-group" data-validate="number">
        <input value="{{ old('cp') }}" type="text" class="form-control" name="cp" id="cp" placeholder="Ingrese solo números" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        </div>

        <div class="form-group">
        <label for="validate-number">Cantidad de Kilómetros lugar de procedencia:</label>
        <a href="#openModalProcedencia" title="Ayuda">
                <span >
                  <i class="glyphicon glyphicon-info-sign"></i>
                </span>
              </a>
        <div class="input-group" data-validate="number">
        <input value="{{ old('kmprocedencia') }}" type="number" min="0" class="form-control" name="kmprocedencia" id="kmprocedencia" placeholder="Ingrese solo números" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        </div>           

         <div id="openModalProcedencia" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h3>Cantidad de Km Procedencia</h3>
                    <p>En este campo se debe ingresar la cantidad de kilómetros de distancia que el estudiante tiene desde su lugar de procedencia hasta la sede de la Facultad.</p>
                    <p>Ej: 310km de distancia entre la sede Oro Verde de la Facultad de Ciencia y Tecnología y Chajarí</p>
                </div>
              </div>  

        <div class="form-group">
        <label for="validate-letras">Nacionalidad:</label>
        <div class="input-group" data-validate="letras">
        <input value="{{ old('nacionalidad') }}" type="text" class="form-control" name="nacionalidad" id="nacionalidad" placeholder="Ingrese solo letras" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>

        </div>
        

        <div class="form-group">
        <label for="validate-phone">Celular:</label>
            <a href="#openModalCelular" title="Ayuda">
                <span >
                  <i class="glyphicon glyphicon-info-sign"></i>
                </span>
              </a>
        <div class="input-group" data-validate="phone">
        <input value="{{ old('cel') }}" type="text" class="form-control" name="cel" id="cel" placeholder="Ingrese solo números" required >
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        
        </div>

        <div id="openModalCelular" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h2>Número de Celular</h2>
                    <p>Cargar el número de celular sin el 0 y sin el 15</p>
                </div>
              </div>
        


        <div class="form-group">
        <label for="validate-email">E-mail:</label>
        <div class="input-group" data-validate="email">
        <input readonly value="{{ $user->email }}" type="text" class="form-control" name="email" id="email" placeholder="Ingrese un E-mail valido" required>
        <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
        </div>
        </div>
        

        <div class="form-group">
        <label for="validate-optional">Facebook:</label>
         <a href="#openModalFacebook" title="Ayuda">
            <span >
              <i class="glyphicon glyphicon-info-sign"></i>
            </span>
        </a>
        <div class="input-group">
        <input value="{{ old('face') }}" type="text" class="form-control" name="face" id="face" placeholder="Ingrese nombre de usuario de facebook">
        <span class="input-group-addon info"><span class="glyphicon glyphicon-asterisk"></span></span>
        </div>
       
        </div>

         <div id="openModalFacebook" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h3>Nombre de usuario de Facebook</h3>
                    <p>Ingrese el nombre de usuario de su cuenta de Facebook</p>
                    <p>Ej: www.facebook.com/<b>fcytUader</b></p>
                </div>
              </div>
        
        <div class="form-group">
          <label for="validate-letras">Consideraciones particulares</label>
          <a href="#openModalConsideraciones" title="Ayuda">
            <span >
              <i class="glyphicon glyphicon-info-sign"></i>
            </span>
        </a>
          <br>
              <label for="validate-letras" class="label label-info">Discapacidad y/o Enfermedad crónica grave</label>
                <div class="input-group">
                  <select  class="form-control" name="discaest" id="discaest" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value=1>Si</option><option value=0>No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
            
          </div>
        
        </div>
        <div id="openModalConsideraciones" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h2>Consideraciones particulares</h2>
                    <p>Si así es el caso, detalle las enfermedades que afectan al estudiante (Presentación de los certificados médicos correspondientes, diagnóstico y medicación)</p>
                </div>
              </div>

        <div class="col-sm-offset-3 col-sm-4">

         <div id="imagendiscaestdiv" class="form-group" >
        
            </div>  
          </div>
          


        
        <script>

        $(document).ready(function() {
        $('.input-group input[required], .input-group textarea[required], .input-group select[required]').on('change', function() {
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

        $('.input-group input[required], .input-group textarea[required], .input-group select[required]').trigger('change');

               
        });


        </script>

<div class="col-sm-offset-2 col-sm-6">

<ul class="list-unstyled pull-right">
          <li><a href="#top" class="btn btn-primary next-step">
                Siguiente</a>    
         </li>
        </ul>
      
      </div>
            
    <!-- div cierra columna -->
  </div>
</div>


<script type="text/javascript">

$('#discaest').on('change',function()
{
var selected = $(this).val();

if (selected === "") {


}
else{

if(selected === "1") {
 $('#imagendiscaestdiv').html(" <label class='label label-info' for='validate-number'>Imagen Certificado</label> <div class='input-group'>   <input  type='file' id='imagendiscaest' name='imagendiscaest' class='form-control' accept='.jpg, .jpeg, .png' required><span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>              </div></div> <div id='list-imagendiscaest-1' style='display:none;' class='form-group'><div class='input-group'>       <img class='thumb' id='list-imagendiscaest' />   </div></div>");

$(document).ready(function() {
       
        $('#imagendiscaest').on('change', function() {
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

        
        $('#imagendiscaest').trigger('change');

               
         });

}
else if(selected === "0") {

$('#imagendiscaestdiv').html('');
}
}

});
</script>

<script >
           
       
$("#provincia").change(function (event) {
             
              $("#localidad").empty();
              $("#localidad").append("<option value='' selected>Seleccione una localidad </option>");
              $.get("localidad/"+event.target.value+"", function(response, state) {
              
              for(i=0; i<response.length; i++){
              $("#localidad").append("<option value='"+response[i].id+"'>"+response[i].localidad+" </option>");
            }
            });
        });
     
</script>

<script type="text/javascript">
  $(document).on("click", "input[type='file']", function(evt) {
          let idd = this.id;     
          document.getElementById(idd).onchange = function () {
           var reader = new FileReader();
            reader.onload = function (e) {
                var fileInput = document.getElementById(idd);
            var filePath = fileInput.value;
            console.log(filePath);
            var allowedExtensions = /(.jpg|.jpeg|.png|.bmp)$/i;
            if(allowedExtensions.exec(filePath)){
                document.getElementById("list-" + idd).src = e.target.result;    
                document.getElementById("list-" + idd+ "-1").style.display = "inline";
            }
            else{
                document.getElementById("list-" + idd).src = e.target.result;    
                document.getElementById("list-" + idd+ "-1").style.display = "none";
            }
            
          }; 
          reader.readAsDataURL(this.files[0]); 
        }; 
    
      });        
</script>



  