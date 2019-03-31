<?php




function actualizar_materia(){
  require_once("bdconexion.php");
  $nombre = $_POST['nombre'];
  $id = $_POST['id'];
  if($conn->query("UPDATE materia SET nombre='$nombre' WHERE idmateria=$id")){
    $msg['msg'] = "Materia actualizada correctamente";
    echo json_encode($msg);
  }
}

function buscar_materia(){
  require_once("bdconexion.php");
  $nombre = $_POST['nombre'];
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

function llenar_select(){
  require_once("bdconexion.php");
  $sql = "SELECT * FROM materia";
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
    buscar_materia();
    break;
  case 'actualizar':
    actualizar_materia();
    break;
  case 'llenar':
    llenar_select();
    break;
  default:
    // code...
    break;
}


 ?>
