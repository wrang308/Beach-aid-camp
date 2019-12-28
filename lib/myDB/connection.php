<?php

$servername = 'http://phpmyadmin.cybian.se/';
$username = 'test';
$password = 'JPtGLMerPEEcfuzc';
$dbname = 'markusTestarSaker';
$table = 'test';

 // Create Connection
    $conn = new mysql($servername, $username, $password, $dbname);
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }

try{



} catch(PDOException $exc){

}

?>

