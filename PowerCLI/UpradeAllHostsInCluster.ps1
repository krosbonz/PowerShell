connect-viserver "lgh-vc1-test.lgh.local"
$clusterName = "Tier1 Test"
$vmHosts = Get-Cluster -Name $clusterName | Get-VMHost

foreach ($vmhost in $vmHosts)
{
    $task = Set-VMHost -VMHost $vmhost -State Maintenance
    #Wait-Task -Task $task
    $task = Install-VMHostPatch -VMHost $vmhost -HostPath /vmfs/volumes/enc-mar-template/Updates/ESXi600-202002001_test.zip
    Wait-Task -Task $task
	Restart-VMHost -VMHost $vmhost
}