<div class="tab-pane" role="tabpanel" id="step5">
    <div class="container">
      <div class="row">
        <h3>1.5 - Viaja para cursar</h3>
      </div>

        <div class="col-sm-offset-2 col-sm-6">

          <div class="form-group">
              <label for="validate-letras">Utiliza colectivos Urbanos:</label>
                <div class="input-group">
                  <select value="{{ old('urbano') }}" class="form-control" name="urbano" id="urbano" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="Si">Si</option><option value="No">No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>
          </div>

         <div class="col-sm-offset-3 col-sm-4">

    
      <div id="cantviajadiv" class="form-group">
              
          </div>

       </div>
        <div class="col-sm-offset-2 col-sm-6">


          <div class="form-group">
              <label for="validate-letras">Utiliza colectivos de Media Distancia:</label>
              <a href="#openModalMediaDist" title="Ayuda">
                <span >
                  <i class="glyphicon glyphicon-info-sign"></i>
                </span>
              </a>
                <div class="input-group">
                  <select value="{{ old('mediadist') }}" class="form-control" name="mediadist" id="mediadist" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="Si">Si</option><option value="No">No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>
        </div>

          <div id="openModalMediaDist" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h2>Media Distancia</h2>
                    <p>Distancia que se encuentran entre los 50 km y 150 km</p>
                    <p>desde la Facultad hasta la ciudad del estudiante.</p>
                  </div>
              </div>
  

  <div class="col-sm-offset-3 col-sm-4">


    <div  id="cantviajamediadiv" class="form-group">
              
          </div>
    
 
        <div id="recibopasajdiv" class="form-group">

            
            </div>
         
        <div  id="preciopasajediv" class="form-group">
          
        </div>  

        <div id="cantkmdiv" class="form-group">
          

      </div>

    </div>

    <div class="col-sm-offset-2 col-sm-6">


          <div class="form-group">
              <label for="validate-letras">Utiliza colectivos de Larga Distancia:</label>
              <a href="#openModalLargaDist" title="Ayuda">
                <span >
                  <i class="glyphicon glyphicon-info-sign"></i>
                </span>
              </a>
                <div class="input-group">
                  <select value="{{ old('largadist') }}" class="form-control" name="largadist" id="largadist" placeholder="Seleccione una opción" required>
                    <option value="">Seleccione una opción</option>
                    <option value="Si">Si</option><option value="No">No</option>
                </select>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>
        </div>

          <div id="openModalLargaDist" class="modalDialog">
                  <div>
                    <a href="#close" title="Close" class="close">X</a>
                    <h2>Larga Distancia</h2>
                    <p>Distancia que se encuentran a mas de 150 km</p>
                    <p>desde la Facultad hasta la ciudad del estudiante.</p>
                  </div>
              </div>


              <div class="col-sm-offset-3 col-sm-4">


    <div  id="cantviajalargadiv" class="form-group">
              
          </div>
    
 
        <div id="recibopasajlargadiv" class="form-group">

            
            </div>
         
        <div  id="preciopasajelargadiv" class="form-group">
          
        </div>  

        <div id="cantkmlargadiv" class="form-group">
          

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

$('#urbano').on('change',function()
{
var selected = $(this).val();

if (selected === "") {
$('#cantviajadiv').html(""); 

}
else{

if(selected === "Si") {

$('#cantviajadiv').html("<label for='validate-letras' class='label label-info'>Cantidad de veces que viaja por semana</label>                <div class='input-group'>                  <select class='form-control' name='cantviaja' id='cantviaja' placeholder='Seleccione una opción' required>                    <option value=''>Seleccione una opción</option>                    <option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option><option value='32'>32</option><option value='33'>33</option><option value='34'>34</option><option value='35'>35</option><option value='36'>36</option><option value='37'>37</option><option value='38'>38</option><option value='39'>39</option><option value='40'>40</option><option value='41'>41</option><option value='42'>42</option><option value='43'>43</option><option value='44'>44</option><option value='45'>45</option><option value='46'>46</option><option value='47'>47</option><option value='48'>48</option><option value='49'>49</option><option value='50'>50</option>                </select>                <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>            </div>"); 

 $(document).ready(function() {

        $('#cantviaja').on('change', function() {
        
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

        $('cantviaja').trigger('change');
               
        });
 }
else if(selected === "No") {
$('#cantviajadiv').html(""); 
}
}

});
</script>

<script type="text/javascript">

$('#mediadist').on('change',function()
{
var selected = $(this).val();

if (selected === "") {
$('#cantviajamediadiv').html("");
$('#recibopasajdiv').html("");
$('#preciopasajediv').html("");
$('#cantkmdiv').html("");


}
else{

if(selected === "Si") {
$('#cantviajamediadiv').html("<label for='validate-letras' class='label label-info'>Cantidad de veces que viaja por mes</label>                <div class='input-group'>                  <select  class='form-control' name='cantviajamedia' id='cantviajamedia' placeholder='Seleccione una opción' required>                    <option value=''>Seleccione una opción</option>                    <option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option>                </select>                <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>            </div>");
$('#recibopasajdiv').html("<label class='label label-info' for='validate-number'>Recibo Pasaje de transporte</label>        <div class='input-group'><input  type='file' id='recibopasaj' name='recibopasaj' accept='.jpg, .jpeg, .png' class='form-control' required>   <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div> </div><div id='list-recibopasaj-1' style='display:none;' class='form-group'><div class='input-group'>              <img class='thumb' id='list-recibopasaj' /></div>");
$('#preciopasajediv').html("<label for='validate-number' class='label label-info'>Precio del Pasaje $</label>          <div class='input-group' data-validate='number'>            <input   type='number' min='0' class='form-control' name='preciopasaje' id='preciopasaje' placeholder='Ingrese solo números' required>            <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>          </div>");
$('#cantkmdiv').html("<label for='validate-number' class='label label-info'>Cantidad de kilómetros</label>          <div class='input-group' data-validate='number'>            <input type='number' min='0' class='form-control' name='cantkm' id='cantkm' placeholder='Ingrese solo números' required>            <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>          </div>        </div>");
$(document).ready(function() {

        $('#cantviajamedia, #recibopasaj, #preciopasaje, #cantkm').on('change', function() {
        
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

        $('cantviajamedia, #recibopasaj, #preciopasaje, #cantkm').trigger('change');
               
        });
 }
else if(selected === "No") {
$('#cantviajamediadiv').html("");
$('#recibopasajdiv').html("");
$('#preciopasajediv').html("");
$('#cantkmdiv').html("");
}
}

});
</script>


<script type="text/javascript">

$('#largadist').on('change',function()
{
var selected = $(this).val();

if (selected === "") {
$('#cantviajalargadiv').html("");
$('#recibopasajlargadiv').html("");
$('#preciopasajelargadiv').html("");
$('#cantkmlargadiv').html("");


}
else{

if(selected === "Si") {
$('#cantviajalargadiv').html("<label for='validate-letras' class='label label-info'>Cantidad de veces que viaja por año</label>                <div class='input-group'>                  <select  class='form-control' name='cantviajalarga' id='cantviajalarga' placeholder='Seleccione una opción' required>                    <option value=''>Seleccione una opción</option>                    <option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option>                </select>                <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>            </div>");
$('#recibopasajlargadiv').html("<label class='label label-info' for='validate-number'>Recibo Pasaje de transporte</label>        <div class='input-group'><input  type='file' id='recibopasajlarga' name='recibopasajlarga' accept='.jpg, .jpeg, .png' class='form-control' required>   <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span> </div> </div><div id='list-recibopasajlarga-1' style='display:none;' class='form-group'><div class='input-group'>              <img class='thumb' id='list-recibopasajlarga' /></div>");
$('#preciopasajelargadiv').html("<label for='validate-number' class='label label-info'>Precio del Pasaje $</label>          <div class='input-group' data-validate='number'>            <input   type='number' min='0' class='form-control' name='preciopasajelarga' id='preciopasajelarga' placeholder='Ingrese solo números' required>            <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>          </div>");
$('#cantkmlargadiv').html("<label for='validate-number' class='label label-info'>Cantidad de kilómetros</label>          <div class='input-group' data-validate='number'>            <input type='number' min='0'  class='form-control' name='cantkmlarga' id='cantkmlarga' placeholder='Ingrese solo números' required>            <span class='input-group-addon danger'><span class='glyphicon glyphicon-remove'></span></span>          </div>        </div>");
$(document).ready(function() {

        $('#cantviajalarga, #recibopasajlarga, #preciopasajelarga, #cantkmlarga').on('change', function() {
        
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

        $('#cantviajalarga, #recibopasajlarga, #preciopasajelarga, #cantkmlarga').trigger('change');
               
        });
 }
else if(selected === "No") {
$('#cantviajalargadiv').html("");
$('#recibopasajlargadiv').html("");
$('#preciopasajelargadiv').html("");
$('#cantkmlargadiv').html("");
}
}

});
</script>



