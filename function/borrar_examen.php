<?php
  require_once("bdconexion.php");
  $id = $_GET['examen'];
  $sql = "DELETE FROM examen WHERE idexamen=$id";

  $conn->query($sql);

 ?>
