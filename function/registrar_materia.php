<?php
  require_once("bdconexion.php");
  $materia = $_POST['materia'];
  $sql = "INSERT INTO mst_subject (sub_name) VALUES ('$materia')";
  if($conn->query($sql) === TRUE){
    $response = "Insercion correcta";
    echo json_encode($response);
  }


 ?>
