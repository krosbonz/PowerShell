Connect-Viserver esx01-1 -user root
$datastore = Get-Datastore "enc3-vc01-ctx-65"
New-PSDrive -Location $datastore -Name ds -PSProvider VimDatastore -Root “\”
Set-Location ds:\lgh-pvs02
Get-childitem | select name
