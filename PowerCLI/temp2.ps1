$vmhosts = get-cluster -name "Tier1 Test" | get-vmhost
$esxcli = Get-EsxCli -VMHost $vmHosts -V2
$grps = New-Object System.Collections.ArrayList

foreach ($vmHost in $vmhosts) {
    $grps.Add($vmHost) > $null
    $esxcli.software.vib.list.invoke() | Format-table -property Name, Creationdate, Version | Out-File -FilePath "C:\Users\mhauck\Desktop\$vmhost.txt"
}
$first = $grps[0]
foreach ($grp in $grps[1..0]) {
    Write-Host $grp
    Compare-Object -ReferenceObject $(Get-Content C:\Users\mhauck\Desktop\$first.txt) -DifferenceObject $(Get-Content C:\Users\mhauck\Desktop\$grp.txt) -IncludeEqual | Out-File -FilePath C:\Users\mhauck\Desktop\compareit.txt
}