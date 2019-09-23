#Set VMTools upgrade from reboot to manual

$a = Get-Content "list.txt"
foreach ($i in $a){
$vm = Get-VM -Name $i | % {Get-View $_.ID}
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$vmConfigSpec.Tools = New-Object VMware.Vim.ToolsConfigInfo
$vmConfigSpec.Tools.ToolsUpgradePolicy = "manual"
$vm.ReconfigVM($vmConfigSpec)
}