<?php
  require_once("bdconexion.php");
  $materia = $_POST['materia'];
  $sql = "INSERT INTO mst_subject (sub_name) VALUES ('$materia')";
  $conn->query($sql);


 ?>
