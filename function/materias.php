<?php


$nombre = $_POST['nombre'];

function actualizar_materia($nombre){
  require_once("bdconexion.php");
  $id = $_POST['id'];
  if($conn->query("UPDATE materia SET nombre='$nombre' WHERE idmateria=$id")){
    $msg['msg'] = "Materia actualizada correctamente";
    echo json_encode($msg);
  }
}

function buscar_materia($nombre){
  require_once("bdconexion.php");
  $sql = "SELECT * FROM materia WHERE nombre LIKE '%$nombre%'";
  if ($datos = $conn->query($sql)) {
      while ($dato=$datos->fetch_assoc()) {
          $informacion=array(
            'sub_id'=>utf8_encode($dato['idmateria']),
            'sub_name'=>utf8_encode($dato['nombre'])
          );
          $info[]=$informacion;
      }
      echo json_encode($info);
  }
}

switch ($_POST['func']) {
  case 'buscar':
    buscar_materia($nombre);
    break;
  case 'actualizar':
    actualizar_materia($nombre);
    break;
  default:
    // code...
    break;
}


 ?>
