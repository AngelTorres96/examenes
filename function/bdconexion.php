<?php

    $conn = new mysqli('localhost','root','','quiz_new');
    if($conn->connect_error) {
        echo $error->$conn->connect_error;
    }
?>
