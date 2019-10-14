$AllHosts = Get-VMHost | Where {$_.ConnectionState -eq “Connected”}
foreach ($VMHost in $AllHosts) {
$ESXCLI = Get-EsxCli -VMHost $VMHost
$ESXCLI.software.vib.list() | Select VMHost,InstallDate,Name,Version,Vendor,ReleaseDate | Where {$_.Name -match "elxnet" -and $_.Vendor -match "EMU"}
}

$ESXCLI.software.vib.list() | Select InstallDate,Name,Version,Vendor,ReleaseDate | Where {$_.Name -match "elxnet"}


$vmhost = get-cluster -name "Tier 1" | get-vmhost
$esxcli = Get-EsxCli -VMHost $vmHost -V2
$esxcli.software.vib.list.invoke() | Format-table -property Name,Creationdate,Version

$List = @()
$VMHosts = get-cluster -name "Tier 1" | get-vmhost
foreach ($VMHost in $VMHosts) {
  $VMHostName = $VMhost.Name
  $esxcli = $VMHost | Get-EsxCli
  $List += $esxcli.software.vib.list() | Select-Object @{N="VMHostName"; E={$VMHostName}}, *
}
$List | Export-Csv -Path c:\temp\tier1.csv -NoTypeInformation



$List = @()
$VMHosts = get-cluster -name "Tier 1" | get-vmhost
foreach ($VMHost in $VMHosts) {
  $VMHostName = $VMhost.Name
  $esxcli = $VMHost | Get-EsxCli 
  $List += $esxcli.network.nic.get('vmnic0') | format-custom -depth 3
}
$List | Export-Csv -Path c:\temp\tier1test.csv -NoTypeInformation


$vmhost = get-cluster -name "Tier 1" | get-vmhost
$esxcli = Get-EsxCli -VMHost $vmHost -V2
$esxcli.network.nic.get.invoke(@{nicname = 'vmnic0'}) | format-custom -depth 3