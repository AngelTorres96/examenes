<?php

  require_once("bdconexion.php");
  try{
      $alum = $_POST['alumno'];
      $query = "SELECT grupo.idgrupo AS idg FROM grupo INNER JOIN inscripcion ON grupo.idgrupo = inscripcion.idgrupo INNER JOIN usuario ON inscripcion.idusuario=usuario.idusuario WHERE login='$alum'";
      $sql_query = $conn->query($query);

      if($sql_query->num_rows == 0)
          echo "Sin Grupos";
      while($row = $sql_query->fetch_assoc()){
          echo "<div>" . $row["idg"]."</div>" ;
      }
  }
  catch(PDOException $e){
      echo "Error: " . $e -> getMessage();
  }


 ?>
