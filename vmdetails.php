<!DOCTYPE html>
<html>
<head>
	<title>VM Details</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/js/bootstrap.js">
</head>
<body>

<h1 class="text-center" style="color: orange">VM Details</h1>
</body>
</html>


<?php

$server=$_GET['server'];
$vmname=$_GET['name1'];

			$psScriptPath = 'C:\\xampp\htdocs\inframind\vmdetails.ps1';
			$CMD = "powershell.exe -command $psScriptPath -server '$server' -vmname '$vmname'< NUL";
			$output = shell_exec($CMD);
			echo $output;
?>