$( document ).ready(function() {

});

function get_datos_sesion(){

}
function grupos(a){

  $.ajax({
    type: "POST",
    async: true,
    url: "../function/alumnos/get_grupos.php",
    timeout: 12000,
    data:{alumno:a},
    success: function(response)
    {
        $("aside").append(response);
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
