$Path = "C:\Users\mhauck\Desktop\hosttest"

if ($global:DefaultVIServer -eq $null) {
    # Write-Host "No connected vCenter server"
    $vCenter = Read-Host -Prompt "Enter your vCenter server name"
    $user = Read-Host -Prompt "Enter user name"
    $pass = Read-Host -Prompt "Enter password" -AsSecureString
    $plainPwd = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Pass))
    Connect-VIServer $VCenter -User $user -Password $plainPwd
}

If (Test-Path -Path "$Path\compare.txt"){
    Clear-Content "$Path\compare.txt"
}

$Clust = Read-Host -Prompt "Which cluster would you like to work with?"
$RefHost = Read-Host -Prompt "Name of your reference host?"

$VmHosts = get-cluster -name $Clust | get-vmhost
$Grps = New-Object System.Collections.ArrayList

$RefHostEsxcli = Get-EsxCli -VMHost $RefHost -V2
$RefHostEsxcli.software.vib.list.invoke() | Select-Object Name, Creationdate, Version | ConvertTo-HTML -Title ReferenceHost_$RefHost |
Out-File -FilePath "$Path\ReferenceHost_$RefHost.html"

Write-Host "Collecting and comparing VIB information from the cluster..."

foreach ($VmHost in $vmhosts) {
    $Grps.Add($VmHost) > $null
    $Esxcli = Get-EsxCli -VMHost $vmHost -V2
    $Esxcli.software.vib.list.invoke() | Select-Object Name, Creationdate, Version | ConvertTo-HTML -Title $VmHost |
    Out-File -FilePath "$Path\$vmhost.html"
}

foreach ($grp in $Grps) {
    Compare-Object -ReferenceObject $(Get-Content $Path\ReferenceHost_$RefHost.html) -DifferenceObject $(Get-Content $Path\$grp.html) |
    Out-File -Append -FilePath "$Path\compare.txt" 
}
Start-Process "$Path\compare.txt"