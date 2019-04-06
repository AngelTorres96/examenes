
function openQuestion(evt, cityName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the link that opened the tab
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";

}
document.getElementById("default").click();

$( document ).ready(function() {
  $("#paginas").empty();
  verExamenes();
  llenar_select_materias();
});

function insertarExamen(){
  $.ajax({
    type: "POST",
    async: true,
    url: "../function/registrar_examen.php",
    timeout: 12000,
    data: $("#agregar_examen").serialize(),
    success: function()
    {
      alert("Examen cargado.");
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}

function eliminarExamen(value){
  $('#eliminar_examen').modal('show');
  $("#dato_examen").append(value);
  del = value;
}

function confirmDeleteExamen(){
  $.ajax({
    type: "GET",
    async: true,
    url: "../function/borrar_examen.php",
    timeout: 12000,
    data:{examen:del},
    success: function()
    {
      alert("Examen eliminado");
      location.reload();
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}

function verExamenes(){
  $("#filas").empty();
  // $("#paginas").empty();
  // if(p==null)p=1;
  // a=p;
  $.ajax({
    type: "GET",
    async: true,
    url: "../function/get_examenes.php",
    timeout: 12000,
    // data:{pagina:p},
    dataType: "json",
    success: function(response)
    {
      var i=0;
      $.each(response, function(key, value) {
          $("#table_examenes").append(
            "<tr>"+
              "<td>"+value.sub_name+"</td>"+
              "<td>" + value.sub_materia + "</td>" +
              "<td> <a href='#' id='examen_" + value.sub_id + "' onclick='eliminarExamen(" + value.sub_id + ")'>Eliminar</a> </td>" +
            "</tr>"
          );
          i++;
      });
      // getPaginas();

    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}

function llenar_select_materias(){
  var fun="llenar";
  $.ajax({
    type: "POST",
    dataType: "json",
    async: true,
    url: "../function/materias.php",
    timeout: 12000,
    data:{func:fun},
    success: function(response)
    {
      var i=0;
      $.each(response, function(key, value) {
          $("#select_materias").append($('<option>', {
            value: value.sub_id,
            text: value.sub_name
          })
          );
          i++;
      });
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
