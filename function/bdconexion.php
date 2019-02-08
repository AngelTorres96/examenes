<?php

    $conn = new mysqli('localhost','root','','departamental');
    if($conn->connect_error) {
        echo $error->$conn->connect_error;
    }
?>
