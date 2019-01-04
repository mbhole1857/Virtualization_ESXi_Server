<!DOCTYPE html>
<html>
<head>
	<title>Inventory Page</title>
	<!--Use of Bootstrap4 File-->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/js/bootstrap.js">
</head>
<body>
<form method="post" action="">
<h1 class="text-center" style="color: blue">TCS Inframind Solution</h1>
<h2 class="text-center" style="color: orange">Virtualization</h2>
<h3 class="text-center" style="color: grey">Team SAKSHAM</h3>
<br>
<br>
<div class="container text-center">Select DataCenter
<select name="dcenter">
	<option value="all">ALL DATACENTRES</option>
	<option value="d1">DataCenter 1(PUNE)</option>
	<option value="d2">DataCenter 2(CHENNAI)</option>
</select>
&nbsp;
<input type="submit" name="showall" value="SHOW ALL">	
<br>
<br>
</div>
</form>
</body>
</html>

<?php
$username="";
if(isset($_POST['showall']))
 {
		if($_POST['dcenter']=='d1')
		{
			$username="192.168.112.128";
			$psScriptPath = 'C:\\xampp\htdocs\inframind\get-process.ps1';
			$CMD = "powershell.exe -command $psScriptPath -username '$username'< NUL";
			$output = shell_exec($CMD);
			echo $output;
		}
		else if($_POST['dcenter']=='d2')
		{
			$username="192.168.112.131";
			$psScriptPath = 'C:\\xampp\htdocs\inframind\get-process.ps1';
			$CMD = "powershell.exe -command $psScriptPath -username '$username'< NUL";
			$output = shell_exec($CMD);
			echo $output;
		}else if($_POST['dcenter']=='all')
			{
				$u1="192.168.112.128";
				$u2="192.168.112.131";
				$username="";
				$psScriptPath = 'C:\\xampp\htdocs\inframind\allcentres.ps1';
				$CMD = "powershell.exe -command $psScriptPath -u1 '$u1' -u2 '$u2'< NUL";
				$output = shell_exec($CMD);
				echo $output;	
			}else{
					echo "Server Failed";
		 		 }

}
?>