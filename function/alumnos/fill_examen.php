<?php

  require_once("bdconexion.php");
  try{
      $examen = $_POST['id'];
      $query = "SELECT descripcion, opc1, opc2, opc3, opc4 FROM pregunta WHERE idexamen=$examen";
      $sql_query = $conn->query($query);
      $qty=0;
      if($sql_query->num_rows == 0)
          echo "Sin Preguntas";
      while($row = $sql_query->fetch_assoc()){
          $qty++;
          $str = "'Q$qty'";
          if($qty==1)echo "<button id=\"default\" class=\"tablinks\" onclick=\"openQuestion(event, ".$str.")\">Pregunta 1</button></div>";
          else echo "<button class=\"tablinks\" onclick=\"openQuestion(event, ".$str .")\">Pregunta $qty</button></div>";

      }

  }
  catch(PDOException $e){
      echo "Error: " . $e -> getMessage();
  }
 ?>
