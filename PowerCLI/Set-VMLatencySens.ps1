$VMs = Get-Content "C:\Users\mhauck\Desktop\vm_lat.txt"

$spec = New-Object VMware.Vim.VirtualMachineConfigSpec
$spec.latencySensitivity = New-Object VMware.Vim.LatencySensitivity
$spec.LatencySensitivity.Level = [VMware.Vim.LatencySensitivitySensitivityLevel]::normal

foreach ($i in $VMs) {
    $vm = get-vm -name $i    
    $vm.ExtensionData.ReconfigVM($spec)
    Get-View $vm -Property Name, Config.LatencySensitivity | Select Name, @{N = 'Sensitivity Level'; E = { $_.Config.LatencySensitivity.Level } }
}

