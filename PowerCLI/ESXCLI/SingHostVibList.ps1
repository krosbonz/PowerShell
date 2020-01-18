# https://www.virten.net/2016/11/how-to-use-esxcli-v2-commands-in-powercli/

Connect-VIServer lgh-vc1.lgh.local -User root 
$esxcli = Get-EsxCli -V2 -VMHost esx05-1.lgh.local 

$esxcli.software.vib.list.invoke() | export-csv -path c:\users\mhauck\desktop\ESX05-1_vibList.csv