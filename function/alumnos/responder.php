<?php

  require_once("bdconexion.php");
  try{
      $examen = $_POST['id'];
      $alumno=$_POST['control'];
      $pregunta=$_POST['pregunta'];
      $respuesta=$_POST['resp'];

      $query = "INSERT INTO respuesta (idusuario,idexamen,idpregunta,respuesta) VALUES ($alumno,$examen,$pregunta,'$respuesta')";
      $sql_query = $conn->query($query);
      if($sql_query) echo "Guardado";
      else echo "Error a guardar su respuesta";
  }
  catch(PDOException $e){
      echo "Error: " . $e -> getMessage();
  }
 ?>
