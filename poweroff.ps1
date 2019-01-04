Param(
[string]$vmname,
[string]$servname
)

$ESXIP = $servname
$ESXUser = "root"
$ESXPWD = "Admin@123"
$connection = Connect-viserver $ESXIP -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue

echo $username
$result=Stop-VM -Confirm:$false $vmname
