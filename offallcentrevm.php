<?php
$u1=$_GET['u1'];
$u2=$_GET['u2'];

$psScriptPath = "C:\\xampp\htdocs\inframind\offallcentrevm.ps1";

$CMD = "powershell -command $psScriptPath -u1 '$u1' -u2 '$u2'< NUL" ;
$output = shell_exec($CMD);
echo $output;

header("Location:show.php");


 ?>