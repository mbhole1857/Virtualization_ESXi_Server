
Param(
[string]$servname
)

$ESXIP = $servname
$ESXUser = "root"
$ESXPWD = "Admin@123"
$connection = Connect-viserver $ESXIP -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue

$result=Get-VM

foreach($process in $result)
{
			If ($process.PowerState -eq "PoweredOn")
            {
               Stop-VM -Confirm:$false $process.Name
            }
}


