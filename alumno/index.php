<?php

  //reanuda la sesion
  session_start();
  //valida si la sesion esta activa
  if (session_status() === PHP_SESSION_ACTIVE && $_SESSION['alumno']!="") {
    $session_value=$_SESSION['alumno'];
  }else{
  	header("Location: login.php");
  	exit();
  }



 ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Examenes departamentales</title>
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/main.css">


</head>

<body>
  <?php include_once "../templates/header.php"?>
  <article>

  </article>
  <aside  >
    <h2>Mis materias</h2>
    <br>
  </aside>
  <footer></footer>
  <script src="../js/jquery-3.3.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/alumno.js"></script>

</body>
<script>
      //obtenemos la variable de sesion
      var myvar='<?php echo $session_value;?>';
      console.log(myvar);
      //llamamos al metodo get_datos para obtener todos los datos del alumno
      grupos(myvar);
   </script>
</html>
