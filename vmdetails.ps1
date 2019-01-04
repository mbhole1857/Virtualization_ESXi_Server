Param(
[string]$server,
[string]$vmname
)

$ESXUser = "root"
$ESXPWD = "Admin@123"

$connection = Connect-viserver $server -user $ESXUser -Password $ESXPWD -WarningAction SilentlyContinue


$processes=Get-VM $vmname 
Write-Output "<div class="container table-responsive">"
Write-Output "<table class="table table-bordered table-striped" border='1'>"
Write-Output "  <thead>"
Write-Output "  <tr>"
Write-Output "      <th>Operating System</th>"
Write-Output "      <th>VM Name</th>"
Write-Output "      <th>Number of CPU</th>"
Write-Output "      <th>Memory Assigned</th>"
Write-Output "      <th>PowerState</th>"
Write-Output "      <th>Space Assigned</th>"
Write-Output "      <th>Space Used</th>"
Write-Output "      <th>Host</th>"
Write-Output "  </tr>"
Write-Output "  </thead>"
Write-Output "   <tbody>"
foreach($vm in $processes)
{
Write-Output "  <tr>"
Write-Output "      <td>$($vm.ExtensionData.Config.GuestFullName)</td>"
Write-Output "      <td>$($vm.Name)</td>"
Write-Output "      <td>$($vm.NumCpu)</td>"
Write-Output "      <td>$($vm.MemoryMB) MB</td>"
Write-Output "      <td>$($vm.PowerState)</td>"
Write-Output "      <td>$($vm.ProvisionedSpaceGB) GB</td>"
Write-Output "      <td>$($vm.UsedSpaceGB)GB</td>"
Write-Output "      <td>$($vm.VMHost)</td>"


Write-Output "  </tr>"
}
Write-Output "  </tbody>"
Write-Output "  </table>"
Write-Output "  </div>"






$vms.CPUShare = $vm.Config.CpuAllocation.Shares.Level

 

$vms.TotalMemory = $vm.summary.config.memorysizemb

 

$vms.MemoryHotAdd = $vm.Config.MemoryHotAddEnabled

 

$vms.MemoryShare = $vm.Config.MemoryAllocation.Shares.Level

 

$vms.TotalNics = $vm.summary.config.numEthernetCards

 

$vms.OverallCpuUsage = $vm.summary.quickStats.OverallCpuUsage

 

$vms.MemoryUsage = $vm.summary.quickStats.guestMemoryUsage

 

$vms.ToolsStatus = $vm.guest.toolsstatus

 

$vms.ToolsVersion = $vm.config.tools.toolsversion

 

$vms.TimeSync = $vm.Config.Tools.SyncTimeWithHost

 

$vms.HardwareVersion = $vm.config.Version

 

$vms.MemoryLimit = $vm.resourceconfig.memoryallocation.limit

 

$vms.MemoryReservation = $vm.resourceconfig.memoryallocation.reservation

 
