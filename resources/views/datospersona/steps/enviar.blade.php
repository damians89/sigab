


  <div class="tab-pane" role="tabpanel" id="complete">
    <div class="container">
      <div class="row">
        <h3>Enviar</h3>
      </div>

<div class="col-sm-offset-2 col-sm-6">
        	<h4>Consigne los motivos por los cuales necesitaría obtener la beca</h4>		
          <div class="form-group">
              <label for="validate-letras">Motivos:</label>
                <div class="input-group">
                <textarea value="{{ old('motivos') }}" class="form-control" name="motivos" id="motivos" placeholder="Ingrese solo letras" required></textarea>
                <span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
            </div>
          </div>

        
        <ul class="list-inline pull-right">
            <li><a href="#top" class="btn btn-default prev-step">Anterior</a></li>
            <li><button type="submit" class="btn btn-primary btn-info-full next-step">Enviar</button></li>
        </ul>
    </div>
 </div>
</div>


