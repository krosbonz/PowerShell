$dcenter = Read-Host -Prompt 'Name of Datacenter?'
$cname = Read-Host -Prompt 'Name of Cluster?'

$vmhosts = @(Get-datacenter -Name $dcenter | Get-Cluster -Name $cname | Get-VMHost)

foreach ($vmhost in $vmhosts) {
    $esxcli = Get-EsxCli -VMhost $thing -V2
    $nicinfo = $esxcli.network.nic.get.Invoke(@{nicname = "vmnic0" } ) | Format-Custom -Depth 3
    # Must use "Format-Custom -Depth 3" to get driver details, otherwise will only show "VMware.VimAutomation.ViCore.Impl.V1.EsxCli.EsxCliObjectImpl"
    # This expands nested objects
    Write-Output $vmhost $nicinfo 
}
