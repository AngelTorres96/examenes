<?php
  require_once("bdconexion.php");
  $materia = $_POST['materia'];
  $sql = "UPDATE materia SET nombre='$materia'";
  if($conn->query($sql)){
    echo "actualizacion correcta";
  }


 ?>
