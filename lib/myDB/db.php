<?php

$dns = 'mysql:host=localhost;dbname=id12049341_flutter;';
$user = 'id12049341_markus';
$pass = 'eH@94oBGPD!d7#qb';

try{
    $db = new PDO($dns, $user, $pass);
    echo 'connected';
} catch(PDOException $e){
    $error = $e->getMessage();
    echo $error;
}