<?php
/* 
 CONNECT-DB.PHP
 Allows PHP to connect to your database
*/


// Database Variables (edit with your own server information)

$connection = new PDO('mysql:host=localhost;dbname=untiemyw_VzW1;charset=utf8mb4', 'untiemyw_sandman', 'JAN1982jds!!!!', array(PDO::ATTR_EMULATE_PREPARES => false, PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));


?>