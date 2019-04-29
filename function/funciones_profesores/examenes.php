<?php


  function get_examenes_sel(){
    include_once "bdconexion.php";
    $id_materia = $_POST['id_materia'];
    $sql="SELECT * FROM examen WHERE idmateria=$id_materia";
    if ($datos = $conn->query($sql)) {
        while ($dato=$datos->fetch_assoc()) {
            $informacion=array(
              'id_examen'=>utf8_encode($dato['idexamen']),
              'nombre'=>utf8_encode($dato['nombre'])
            );
            $info[]=$informacion;
        }
        echo json_encode($info);
    }
  }
  function get_qty_question(){
    include_once "bdconexion.php";
    $id_examen = $_POST['id_examen'];
    $info=[];
    $sql="SELECT COUNT(*) as Numero FROM pregunta WHERE idexamen=$id_examen";
    if ($datos = $conn->query($sql)) {
        while ($dato=$datos->fetch_assoc()) {
            $informacion=array(
              'num'=>utf8_encode($dato['Numero'])
            );
            $info[]=$informacion;
        }
        echo json_encode($info);
    }

  }
  function guardar_pregunta(){
    include_once "bdconexion.php";
    $id_examen = $_POST['id_examen'];
    $id_pregunta=$_POST['pre'];
    $pregunta = $_POST['pregunta'];
    $resp1 = $_POST['resp1'];
    $resp2 = $_POST['resp2'];
    $resp3 = $_POST['resp3'];
    $resp4 = $_POST['resp4'];
    $respc = $_POST['respc'];
    if($conn->query("UPDATE pregunta SET descripcion='$pregunta', opc1='$resp1',opc2='$resp2',opc3='$resp3',opc4='$resp4',respuesta='$respc' WHERE idexamen=$id_examen AND idpregunta=$id_pregunta")){
      $info=[];
      $informacion=array('resp'=>utf8_encode("Guardado."));
      $info[]=$informacion;
      echo json_encode($info);
    }
  }
  function eliminar_pregunta(){
    include_once "bdconexion.php";
    $id_examen = $_POST['id_examen'];
    $id_pregunta=$_POST['pre'];
    if($conn->query("DELETE FROM pregunta WHERE idexamen=$id_examen AND idpregunta=$id_pregunta")){
      $info=[];
      $informacion=array('resp'=>utf8_encode("Pregunta eliminada."));
      $info[]=$informacion;
      echo json_encode($info);
    }
  }
  function agregar_pregunta(){
    include_once "bdconexion.php";
    $id_examen = $_POST['id_examen'];
    $numero = $_POST['num'];
    $sql ="INSERT INTO pregunta (`idpregunta`,`idexamen`,`descripcion`,`opc1`,`opc2`,`opc3`,`opc4`,`respuesta`) VALUES ($numero,$id_examen,'','','','','','')";
    $conn->query($sql);
  }


  switch ($_POST['func']) {

    case 'llenar_examen':
      get_examenes_sel();
      break;
    case 'cantidad':
      get_qty_question();
      break;
    case 'eliminar_pregunta':
      eliminar_pregunta();
      break;
    case 'guardar_pregunta':
      guardar_pregunta();
      break;
    case 'agregar_pregunta':
      agregar_pregunta();
      break;
    default:
      // code...
      break;
  }

 ?>
