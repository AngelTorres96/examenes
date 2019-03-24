<?php
  require_once("bdconexion.php");
  $materia = $_POST['materia'];
  $nombre = $_POST['nombre'];
  $sql = "INSERT INTO examen (nombre, idmateria) VALUES ('$nombre', '$materia')";
  $conn->query($sql);


 ?>
