Param(
[string]$u1,
[string]$u2
)

$ESXUser = "root"
$ESXPWD = "Admin@123"

$connection = Connect-viserver $u1 -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue
$connection1 = Connect-viserver $u2 -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue

$processes=Get-VM |Sort
Write-Output "<div class="container table-responsive">"
Write-Output "<table class="table table-bordered table-striped" border='1'>"
Write-Output "  <thead>"
Write-Output "  <tr>"
Write-Output "      <th>Operating System</th>"
Write-Output "      <th>VM Name</th>"
Write-Output "      <th>Power State</th>"
Write-Output "      <th><a href='onallcentrevm.php?u1=$u1&u2=$u2'>ON ALL VM</a></th>"
Write-Output "      <th><a href='offallcentrevm.php?u1=$u1&u2=$u2'>OFF ALL VM</a></th>"
Write-Output "  </tr>"
Write-Output "  </thead>"
Write-Output "   <tbody>"
foreach($process in $processes)
{
Write-Output "  <tr>"
Write-Output "      <td>$($process.ExtensionData.Config.GuestFullName)</td>"
Write-Output "      <td>$($process.Name)</td>"
$name=$($process.Name)
Write-Output "      <td>$($process.PowerState)</td>"
If ($process.PowerState -eq "PoweredOff")
            {
            Write-Output "<td><a href='maintain.php?name1=$name&server=$($process.VMHost.Name)'>ON VM</a></td>"
            }
If ($process.PowerState -eq "PoweredOn")
				{
			Write-Output "      <td><a href='maintainoff.php?name1=$name&server=$($process.VMHost.Name)'>OFF VM</a></td>"		}
Write-Output "      <td><a href='vmdetails.php?name1=$name&server=$($process.VMHost.Name)'>VM Details</a></td>"			
Write-Output "  </tr>"
}
Write-Output "  </tbody>"
Write-Output "  </table>"
Write-Output "  </div>"