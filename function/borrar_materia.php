<?php
  require_once("bdconexion.php");
  $id = $_GET['materia'];
  $sql = "DELETE FROM mst_subject WHERE sub_id=$id";

  $conn->query($sql);

 ?>
