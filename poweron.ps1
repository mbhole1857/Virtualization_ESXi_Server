Param(
[string]$vmname,
[string]$servname
)

$ESXIP = $servname
$ESXUser = "root"
$ESXPWD = "Admin@123"
$connection = Connect-viserver $ESXIP -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue

$result=Start-VM -Confirm:$false $vmname






