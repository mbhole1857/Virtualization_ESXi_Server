<?php

$vmname=$_GET['name1'];
$servname=$_GET['server'];
echo $vmname;
echo $servname;
$psScriptPath = "C:\\xampp\htdocs\inframind\poweroff.ps1";

$CMD = "powershell -command $psScriptPath -vmname '$vmname' -servname '$servname'< NUL" ;
$output = shell_exec($CMD);
echo $output;

header("Location:show.php");


 ?>