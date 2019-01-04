<?php
$servname=$_GET['server'];

$psScriptPath = "C:\\xampp\htdocs\inframind\offallvm.ps1";

$CMD = "powershell -command $psScriptPath -servname '$servname'< NUL" ;
$output = shell_exec($CMD);
echo $output;

header("Location:show.php");


 ?>