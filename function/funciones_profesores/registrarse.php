<?php
  $user = $_POST['txtusuario'];
  $pass = $_POST['txtpass'];
  $cpass = $_POST['txtcpass'];
  $nombre = $_POST['txtnombre'];
  $email = $_POST['txtcorreo'];
  require_once("bdconexion.php");
  $contador=0;
  if(!empty($user)) $contador++;
  if(!empty($pass)) $contador++;
  if(!empty($cpass)) $contador++;
  if(!empty($nombre)) $contador++;
  if(!empty($email)) $contador++;

$gen = md5(uniqid(mt_rand(), false));



  if($contador==5){
    if($pass==$cpass){
      echo "entra";
      if($conn->query("INSERT INTO profesor (`user`,`pass`,`nombre`,`e_mail`,`token`) VALUES ('$user','$pass','$nombre','$email','$gen')")){
        header("Location: ../../profesor/login.php");

        if (filter_var($email, FILTER_VALIDATE_EMAIL)){
            $para = "$email";
            $titulo="Recuperacion de cuenta de modaimperio.com";
            $mensaje ="Ingresa a la siguiente liga para recuperar tu cuenta: \nhttps://localhost/activate.php?token=$gen";
            $cabecera = 'MIME-Version: 1.0' . '\r\n';
            $cabecera .= 'Content-type: text/html; charset=iso-8859-1'.'\r\n';
            mail($para,$titulo,$mensaje,$cabecera);

        echo "Revisa tu bandeja de entrada para que recuperes tu cuenta.";


        } else {
        echo "Error: ingresa una cuenta de correo válida.";
        }
      }
    }
  }
 ?>
