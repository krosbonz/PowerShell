$Hosts = Get-VMHost
$search = '*/locker/packages/*'
foreach ($i in $Hosts) {
    $Hostval = $i | Get-AdvancedSetting -Name UserVars.ProductLockerLocation | Select-Object Value
    if ($Hostval -like $search) {
        Write-Host $i
        Get-AdvancedSetting -Entity $i -Name UserVars.ProductLockerLocation | Set-AdvancedSetting -Value "/vmfs/volumes/56969620-328b6148-2c56-0017a4770002/vmtools" -confirm:$False
    }
}