var a=0;
var del;
var upd;
var mod;
var name;


$( document ).ready(function() {
  $("#paginas").empty();
  verMaterias();
  verExamenes();
  llenar_select_materias();
});



function insertarMateria(){
  $.ajax({
    type: "POST",
    async: true,
    url: "../function/registrar_materia.php",
    timeout: 12000,
    data: $("#form").serialize(),
    success: function()
    {
      alert("Materia cargada.");
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}



function verMaterias(p){
  $("#filas").empty();
  $("#paginas").empty();
  if(p==null)p=1;
  a=p;
  $.ajax({
    type: "GET",
    async: true,
    url: "../function/get_materias.php",
    timeout: 12000,
    data:{pagina:p},
    dataType: "json",
    success: function(response)
    {
      var i=0;
      $.each(response, function(key, value) {
          $("#filas").append(
            "<tr>"+

              "<td>"+value.sub_name+"</td>"+
              "<td>"+
              "<a href='#' onclick='modificarMateria("+value.sub_id+")'>Modificar</a>"+
              "|<a href='#' id='href"+value.sub_id+"' onclick='eliminarMateria("+value.sub_id+")'>Eliminar</a>"+
              "</td>"+
            "</tr>"
          );
          i++;
      });
      getPaginas();

    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}



function getPaginas(){
  $("#paginas").empty();
  $.ajax({
    type: "GET",
    async: true,
    url: "../function/get_paginas.php",
    timeout: 12000,
    dataType: "json",
    success: function(response)
    {
      var pag=0;
      if(response%5==0){
        pag = response / 5;

      }else{
        pag = response / 5;
        pag = parseInt(pag);
        pag++;
      }

      for (var i = 0; i <= pag+1; i++) {
        if(i==0)$("#paginas").append("<li onclick='verMaterias(1)'><a>|<<</a></li><li><a><<</a></li>");
        else if(i==pag+1) $("#paginas").append("<li><a>>></a></li><li onclick='verMaterias("+pag+")'><a>>>|</a></li>");
        else{
          if(i==a) $("#paginas").append("<li class='pageSelected'>"+i+"</li>");
          else $("#paginas").append("<li onclick='verMaterias("+i+")'><a>"+i+"</a></li>");
        }

      }

    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
function modificarMateria(value){
  $('#modificar').modal('show');
  upd=value;

}
function confirmMod(){
  $.ajax({
    type: "GET",
    async: true,
    url: "../function/modificar_materia.php",
    timeout: 12000,
    data:{materia:del},
    success: function()
    {
      alert("Materia eliminada");
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
function eliminarMateria(value){
  $('#eliminar').modal('show');
  $("#dato").append(value);
  del = value;
}

function confirmDelete(){
  $.ajax({
    type: "GET",
    async: true,
    url: "../function/borrar_materia.php",
    timeout: 12000,
    data:{materia:del},
    success: function()
    {
      alert("Materia eliminada");
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}



function buscarMateria(){
  $("#filas").empty();
  $("#paginas").empty();
  var t = $("#in_palabra_proyecto").val();
  var fun="buscar";
  $.ajax({
    type: "POST",
    async: true,
    url: "../function/materias.php",
    timeout: 12000,
    data:{func:fun,nombre:t,id:3},
    dataType: "json",
    success: function(response)
    {
      var i=0;
      $.each(response, function(key, value) {
          $("#filas").append(
            "<tr>"+
              "<th scope='row'>"+ value.sub_id +"</th>"+

              "<td>"+
              "<a href='#' onclick='modificarMateria("+value.sub_id+")'>Modificar</a>"+
              "|<a href='#' id='href"+value.sub_id+"' onclick='eliminarMateria("+value.sub_id+")'>Eliminar</a>"+
              "</td>"+
            "</tr>"
          );
          i++;
      });

    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
document.getElementById("tbn_refrescar_filtros_proyectos").addEventListener("click", function(){

});
function actualizarMateria(){

  var t = $("#nuevo_nombre").val();
  var fun="actualizar";
  $.ajax({
    type: "POST",
    async: true,
    url: "../function/materias.php",
    timeout: 12000,
    data:{func:fun,nombre:t,id:upd},
    success: function(response)
    {

    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}



//Recargar consulta de profesores en index

setInterval(cons1,2000);
  function cons1 (){
    $.ajax({
        url:"../function/funciones_profesores/consulta_na.php",
        method: "POST",
        dataType:"text",
        success: function (data) {
         const contenido=document.getElementById('filas1');
         contenido.innerHTML=data;
        }
    });
  }
//Recargar consulta de profesores en index
  setInterval(cons2,2000);
    function cons2 (){
      $.ajax({
          url:"../function/funciones_profesores/consulta_sa.php",
          method: "POST",
          dataType:"text",
          success: function (data) {
           const contenido=document.getElementById('filas2');
           contenido.innerHTML=data;
          }
      });
    }



    function acepar_profe(ide){
     $.ajax({
         url:"../function/funciones_profesores/profesor_aceptar.php?mi_id="+ide,
         method: "GET",
         dataType:"text",
         success: function (data) {
          const contenido=document.getElementById('filas2');
          contenido.innerHTML=data;
         }
     });
       $("#rbusqueda").html("");


    }

    function rechazar_profe(ide){
     $.ajax({
         url:"../function/funciones_profesores/profesor_rechazar.php?mi_id="+ide,
         method: "GET",
         dataType:"text",
         success: function (data) {
          const contenido=document.getElementById('filas2');
          contenido.innerHTML=data;
         }
     });
     $("#rbusqueda").html("");

    }
