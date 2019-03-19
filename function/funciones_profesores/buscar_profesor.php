<?php

include_once 'bdconexion.php';

if ($_POST["texto"] != "") {
  $mi_consulta='SELECT * FROM profesor WHERE nombre LIKE "%'.$_POST["texto"].'%"';
  $result=mysqli_query($conn, $mi_consulta);
  echo "<table>";



                while($row = mysqli_fetch_assoc($result))
                  {
                    echo '<tr>';
                    echo      '<td>'.$row["idprofesor"].' </td>';
                    echo      '<td>'.$row["nombre"].' </td>';
                    echo      '<td> '.$row["e_mail"].' </td>';
                    if ($row['status']==1) {
                      echo      '<td><button class="btn btn-danger" onclick="rechazar_profe('.$row["idprofesor"].')">Rechazar</button>';
                    }elseif ($row['status']==0) {
                      echo      '<td><button class="btn btn-primary" onclick="acepar_profe('.$row["idprofesor"].')">Aceptar</button></td>';
                    }

                    echo       '</tr>';
                  }


              echo "</table>";

/*
*/

}



 ?>
