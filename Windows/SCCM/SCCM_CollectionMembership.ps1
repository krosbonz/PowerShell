$mem = Get-CMCollection -Name "Required Upgrade - Win10 1903 Upgrade" | Get-CMCollectionMember | Select-Object -ExpandProperty Name 
 
$mem | Out-File -FilePath "C:\Users\mhauck\Desktop\computers.txt"