#Set VMTools to upgrade at power cycle

$a = Get-Content "list.txt"
foreach ($i in $a){
$vm = Get-VM -Name $i | % {Get-View $_.ID}
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$vmConfigSpec.Tools = New-Object VMware.Vim.ToolsConfigInfo
$vmConfigSpec.Tools.ToolsUpgradePolicy = "upgradeAtPowerCycle"
$vm.ReconfigVM($vmConfigSpec)
}