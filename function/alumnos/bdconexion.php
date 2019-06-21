<?php
    //fijamos la conexion a la base de datos
    $conn = new mysqli('localhost','root','','departamentales');
    //si la conexion falla enviaremos al cliente el error
    if($conn->connect_error) {
        echo $error->$conn->connect_error;
    }
?>
