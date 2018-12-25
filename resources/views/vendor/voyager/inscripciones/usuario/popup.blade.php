<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Ver imagen</button>
	<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog">
			  <div class="modal-dialog modal-lg">

			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">{{Auth::user()->name}} </h4>
			      </div>
				      <div class="modal-body">
				       	 <img src="{{ action('InscripcionesController@getFile',['filename' => $variable]) }}" alt="" class="img-responsive">
				      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
			      </div>
			    </div>

			  </div>
			</div>

<script>
// When the user clicks on <div>, open the popup
function myFunction() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}
</script>