
$VMs = Get-Content -Path "C:\users\mhauck\Desktop\vm_list.txt"

foreach ($VM in $VMs) {
    $VM
    Get-VM $VM | Update-Tools -NoReboot -RunAsync
}