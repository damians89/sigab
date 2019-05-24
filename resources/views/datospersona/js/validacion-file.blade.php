
<script type="text/javascript">
  $(document).on("click", "input[type='file']", function(evt) {
          let idd = this.id;     
          document.getElementById(idd).onchange = function () {
           var reader = new FileReader();
            reader.onload = function (e) {
              var fileInput = document.getElementById(idd);
              var filePath = fileInput.value;
              var allowedExtensions = /(.jpg|.jpeg|.png|.bmp|.pdf)$/i;

              if(!allowedExtensions.exec(filePath)){
                toastr.options = {
                  "closeButton": false,
                  "debug": false,
                  "newestOnTop": false,
                  "progressBar": true,
                  "positionClass": "toast-top-right",
                  "preventDuplicates": true,
                  "onclick": null,
                  "showDuration": "100",
                  "hideDuration": "1000",
                  "timeOut": "5000",
                  "extendedTimeOut": "1000",
                  "showEasing": "swing",
                  "hideEasing": "linear",
                  "showMethod": "show",
                  "hideMethod": "hide"
                };
                toastr.error("Solo se permiten archivos .jpeg, .jpg, .png y .pdf");
                fileInput.value = '';
                return false;

            }else{    
              if(allowedExtensions.exec(filePath)){
                  document.getElementById("list-" + idd).src = e.target.result;    
                  document.getElementById("list-" + idd+ "-1").style.display = "inline";
              }
              else{
                  document.getElementById("list-" + idd).src = e.target.result;    
                  document.getElementById("list-" + idd+ "-1").style.display = "none";
              }
            }
          }; 
          reader.readAsDataURL(this.files[0]); 
        }; 
    
      });        
</script>
