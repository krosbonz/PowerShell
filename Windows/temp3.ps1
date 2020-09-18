$foldpath = '\\fileserver\is\IS\Software\Microsoft\Office 2016 Standard\sorce'

if (Test-Path "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE")
{
(& $foldpath\setup.exe /uninstall STANDARD /config  $foldpath\standard.ww\silentUninstallConfig.xml)
Start-Sleep -s 30
Write-Host "Office 2016 is being uninstalled"
$ID3 = (Get-Process -Name set*).Id
Wait-Process -Id $ID3
}
else {Write-Host "Office 2016 is not installed"}