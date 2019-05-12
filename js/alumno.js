$( document ).ready(function() {

});

function realizar_examen(examen){
  var newUrl = "examen.php?idex="+examen;
  window.location.replace(newUrl);
}
function examen(a){

  $.ajax({
    type: "POST",
    async: true,
    url: "../function/alumnos/get_examenes.php",
    timeout: 12000,
    data:{grupo:a},
    success: function(response)
    {
        $("#mis_examenes").append(response);
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
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
