$AllHosts = Get-VMHost 
foreach ($VMHost in $AllHosts) {
    $ESXCLI = Get-EsxCli -VMHost $VMHost
    $vib = $ESXCLI.software.vib.list() | Format-table -property Name, Version, Vendor, InstallDate
    Write-Output $VMHost $vib 
}