# https://www.virten.net/2016/11/how-to-use-esxcli-v2-commands-in-powercli/

Connect-VIServer lgh-vc1.lgh.local -User amhauck 
$esxcli = Get-EsxCli -V2 -VMHost esx02-1.lgh.local 

$esxcli.software.vib.list.invoke() | export-csv -path c:\users\mhauck\desktop\ESX05-1_vibList.csv

$esxcli.software.vib.update -d /vmfs/volumes/enc3-templates/updates/VMware-ESXi-6.5.0-Update3-14990892-HPE-preGen9-.zip