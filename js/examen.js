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

function examen(a){
  $.ajax({
    type: "POST",
    async: true,
    url: "../function/alumnos/get_preguntas.php",
    timeout: 12000,
    data:{id:a},
    success: function(response)
    {
        $("#seccion_pregunta").append(response);
    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
  $.ajax({
    type: "POST",
    async: true,
    url: "../function/alumnos/fill_examen.php",
    timeout: 12000,
    data:{id:a},
    success: function(response)
    {
        $("#preguntas").append(response);

    },
    error: function(jqXHR, textStatus, errorThrown){
      console.log(errorThrown);
    }
  });
}
