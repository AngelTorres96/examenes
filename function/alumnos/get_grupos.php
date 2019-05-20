<?php

  require_once("bdconexion.php");
  try{
      $alum = $_POST['alumno'];
      $query = "SELECT grupo.nombre AS idg, grupo.idgrupo AS idgrupo FROM grupo INNER JOIN inscripcion ON grupo.idgrupo = inscripcion.idgrupo INNER JOIN usuario ON inscripcion.idusuario=usuario.idusuario WHERE login='$alum'";
      $sql_query = $conn->query($query);

      if($sql_query->num_rows == 0)
          echo "Sin Grupos";
      while($row = $sql_query->fetch_assoc()){
        $num = $row["idgrupo"];
          echo "<div><button class='tablinks' onclick='examen($num)'>" . $row["idg"]."</button></div>" ;
      }
  }
  catch(PDOException $e){
      echo "Error: " . $e -> getMessage();
  }


 ?>
