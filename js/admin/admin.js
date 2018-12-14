$( document ).ready(function() {
  verMaterias();
  getPaginas();
});
//extrae la informacion del select y retorna una consulta con los investigadores
//correspondientes a una linea
function insertarMateria(){
  $.ajax({
    type: "POST",
    async: true,
    url: "../function/registrar_materia.php",
    timeout: 12000,
    data: $("#form").serialize(),
    dataType: "json",
    success: function(response)
    {
      alert("success");
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}

function verMaterias(){
  $.ajax({
    type: "GET",
    async: true,
    url: "../function/get_materias.php",
    timeout: 12000,

    dataType: "json",
    success: function(response)
    {
      $.each(response, function(key, value) {
          $("#filas").append(
            "<tr>"+
              "<th scope='row'>1</th>"+
              "<td>Mark</td>"+
              "<td>Modificar</td>"+
              "<td>Eliminar</td>"+
            "</tr>"
          );
      });
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
function getPaginas(){
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
      for (var i = 0; i < pag; i++) {
        $("#paginas").append("<li><a>i</a></li>");
      }

    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
