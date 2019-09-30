Connect-Viserver "host-or-ip-entered-here" -user "userid-entered-here" -password "password-entered-here"
$datastore = Get-Datastore “Datastore-name-entered-here”
New-PSDrive -Location $datastore -Name ds -PSProvider VimDatastore -Root “\”
Set-Location ds:\”folderpath-here”
Get-childitem | select name
