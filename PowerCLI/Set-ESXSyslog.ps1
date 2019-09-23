#Get Each Host Connected to the vC
foreach ($myHost in get-VMHost)
{
    #Display the ESXi Host that you are applying the changes to
    Write-Host '$myHost = ' $myHost

    #Set the Syslog LogHost
    Set-VMHostAdvancedConfiguration -Name Syslog.global.logHost -Value 'lgh-vmlogs.lgh.local,lgh-vc01.lgh.local' -VMHost $myHost
  
    #Use Get-EsxCli to restart the syslog service
    $esxcli = Get-EsxCli -VMHost $myHost
    $esxcli.system.syslog.reload()

    #Open the firewall on the ESX Host to allow syslog traffic
    Get-VMHostFirewallException -Name "syslog" -VMHost $myHost | set-VMHostFirewallException -Enabled:$true
}