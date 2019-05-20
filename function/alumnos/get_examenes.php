<?php

  require_once("bdconexion.php");
  try{
      $grupo = $_POST['grupo'];
      $query = "SELECT examen.nombre AS exn,examen.idexamen AS idex FROM examen INNER JOIN asignacion ON examen.idexamen = asignacion.idexamen INNER JOIN grupo ON asignacion.idgrupo=grupo.idgrupo INNER JOIN inscripcion ON inscripcion.idgrupo=grupo.idgrupo WHERE grupo.idgrupo=$grupo";
      $sql_query = $conn->query($query);
      if($sql_query->num_rows == 0)
          echo "Sin Examenes";
      while($row = $sql_query->fetch_assoc()){
        $examen=$row["idex"];
          echo "<div style='display:block'><p>" .$row["exn"]."<p><button class='form-control btn-primary' style='width:150px' onclick='realizar_examen($examen)'>Realizar prueba</button></div>" ;
      }
  }
  catch(PDOException $e){
      echo "Error: " . $e -> getMessage();
  }


 ?>
