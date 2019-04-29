var qty=0;
var cargo=false;
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
//document.getElementById("default").click();

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
          $("#select_materias_filter").append($('<option>', {
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
function llenar_select_examenes(){
  var fun="llenar_examen";
  $("#examenes").empty();
  var id=$("#select_materias_filter").val();
  $.ajax({
    type: "POST",
    dataType: "json",
    async: true,
    url: "../function/funciones_profesores/examenes.php",
    timeout: 12000,
    data:{func:fun,id_materia:id},
    success: function(response)
    {
      $("#examenes").append("<option value='default'></option>"
      );
      $.each(response, function(key, value) {
          $("#examenes").append($('<option>', {
            value: value.id_examen,
            text: value.nombre
          })
          );
      });
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}

function add_question(){
  var fun="cantidad";
  var id=$("#examenes").val();

  if(cargo==false){
    $.ajax({
      type: "POST",
      dataType: "json",
      async: true,
      url: "../function/funciones_profesores/examenes.php",
      timeout: 12000,
      data:{func:fun,id_examen:id},
      success: function(response)
      {
        $.each(response, function(key, value) {
            qty=value.num;
        });
        cargo=true;
      },
      error: function(jqXHR, textStatus, errorThrown){
        console.log(errorThrown);
      }
    });

  }else{
    qty++;
    console.log(qty);
    var str = "openQuestion(event,'Q"+qty+"')>";
    $("#preguntas").append(
      "<button class='tablinks' onclick="+str+"Pregunta "+qty+"</button>"
    );
    $("#seccion_pregunta").append("<div id='Q" +qty+ "' class='tabcontent'>"+
      "<h3>Pregunta "+qty+"</h3>"+
      "<p>Ingresa la pregunta.</p>"+
      "<form id='pregunta"+qty+"'>"+
        "<input type='text' name='pregunta' placeholder='Pregunta' class='form-control'><br>"+
        "<input type='text' name='resp1' placeholder='Respuesta 1' class='form-control'><br>"+
        "<input type='text' name='resp2' placeholder='Respuesta 2' class='form-control'><br>"+
        "<input type='text' name='resp3' placeholder='Respuesta 3' class='form-control'><br>"+
        "<input type='text' name='resp4' placeholder='Respuesta 4' class='form-control'><br>"+
        "<input type='text' name='respc' placeholder='Respuesta Correcta' class='form-control'><br>"+
        "<button class='btn btn-primary' style='float:right' onclick='guardar_pregunta("+qty+")'>Guardar</button>"+
        "<button class='btn btn-danger' style='float:left' onclick='eliminar_pregunta("+qty+")'>Borrar</button>"+
      "</form>"+
    "</div>");
    var func="agregar_pregunta";
    $.ajax({
      type: "POST",
      dataType: "json",
      async: true,
      url: "../function/funciones_profesores/examenes.php",
      timeout: 12000,
      data:{func:func,id_examen:id,num:qty},
      success: function(response)
      {

      },
      error: function(jqXHR, textStatus, errorThrown){
        console.log(errorThrown);
      }
    });
  }



}
function get_questions(){

  var fun="llenar_examen";
  var id=$("#select_materias_filter").val();
  $.ajax({
    type: "POST",
    dataType: "json",
    async: true,
    url: "../function/funciones_profesores/examenes.php",
    timeout: 12000,
    data:{func:fun,id_materia:id},
    success: function(response)
    {
      $.each(response, function(key, value) {
          $("#examenes").append($('<option>', {
            value: value.id_examen,
            text: value.nombre
          })
          );
      });
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
//+"&func=guardar_pregunta&id_examen="+id+"&pre="+idq
function guardar_pregunta(idq){
  var id=$("#examenes").val();
  $.ajax({
    type: "POST",
    dataType: "json",
    async: true,
    url: "../function/funciones_profesores/examenes.php",
    timeout: 12000,
    data:$("#pregunta"+idq).serialize()+"&func=guardar_pregunta&id_examen="+id+"&pre="+idq,
    success: function(response)
    {
      $.each(response, function(key, value) {
          alert(value.resp);
      });
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
function eliminar_pregunta(idq){
  var id=$("#examenes").val();
  $.ajax({
    type: "POST",
    dataType: "json",
    async: true,
    url: "../function/funciones_profesores/examenes.php",
    timeout: 12000,
    data:"&func=eliminar_pregunta&id_examen="+id+"&pre="+idq,
    success: function(response)
    {
      $.each(response, function(key, value) {
          alert(value.resp);
      });
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
