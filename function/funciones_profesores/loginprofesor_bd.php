<?php
  require_once('bdconexion.php');
  if(isset($_POST['login'])) {
    $usuario = $_POST['txtusuario'];
    $pass = $_POST['txtpass'];
    if(empty($usuario) | empty($pass)){
      //header("Location: ../../profesor/login.php");
      //exit();
    }
    $sql = mysqli_query($conn,"SELECT * FROM profesor WHERE user = '$usuario' and pass ='$pass'");
    if($row = mysqli_fetch_array($sql)){
      session_start();
      $_SESSION['profesor'] = $usuario;
      //indica aqui la ruta a donde te redireccionara en caso que el login sea correcto}
      
      header("Location: ../../profesor/index.php");
    }else{
    //  header("Location: ../../profesor/login.php");
    }
  }
 ?>
