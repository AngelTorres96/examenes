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
          echo "<div id='Q" .$qty. "' class='tabcontent'>".
            "<br>".
            "<p>".$row["descripcion"]."</p>".
            "<form id='pregunta".$qty."'>".
              "<input type='radio' name='radio'>".$row["opc1"]."<br>".
              "<input type='radio' name='radio'>".$row["opc2"]."<br>".
              "<input type='radio' name='radio'>".$row["opc3"]."<br>".
              "<input type='radio' name='radio'>".$row["opc4"]."<br>".
              "<button class='btn btn-primary' style='float:right' onclick='guardar_pregunta(".$qty.")'>Guardar</button>".
            "</form>".
          "</div>" ;
      }

  }
  catch(PDOException $e){
      echo "Error: " . $e -> getMessage();
  }


 ?>
