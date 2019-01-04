Param(
[string]$u1,
[string]$u2
)

$ESXUser = "root"
$ESXPWD = "Admin@123"
$connection = Connect-viserver $u1 -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue
$connection = Connect-viserver $u2 -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue

$result=Get-VM

foreach($process in $result)
{
			If ($process.PowerState -eq "PoweredOn")
            {
               Stop-VM -Confirm:$false $process.Name
            }
}
