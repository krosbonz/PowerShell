$cluster = get-cluster -name "Tier1 Test"
$myVMs = $cluster | get-vm

ForEach ($myVM in $myVMs)
{
Get-VM $myVM | Get-NetworkAdapter | Set-NetworkAdapter -Connected:$true -Confirm:$false
}


$cluster = get-cluster -name "Tier 1"
$myVMs = $cluster | get-vm

ForEach ($myVM in $myVMs) {
    $nics = Get-NetworkAdapter -VM $myVM
    Write-Host $myVM, $nics.ConnectionState
}
