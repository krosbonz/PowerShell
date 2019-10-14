Add-Type -AssemblyName Microsoft.VisualBasic

$vmfile = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\VMware.Vim"


if (-Not (Test-Path $vmfile) ) {
    Install-Module -Name VMware.PowerCLI –Scope CurrentUser -AllowClobber
    Import-Module VMware.PowerCLI
    Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false
} 
elseif(Test-Path $vmfile) {
   Import-Module VMware.PowerCLI
}

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

Connect-VIServer -Server lgh-vc1.lgh.local

$dstore = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the datastore to be expanded", "LGH - VMware Datastore Expander")
$datastore = get-datastore $dstore
$esxi = Get-View -Id ($Datastore.ExtensionData.Host |Select-Object -last 1 | Select -ExpandProperty Key) 
$datastoreSystem = Get-View -Id $esxi.ConfigManager.DatastoreSystem
$expandOptions = $datastoreSystem.QueryVmfsDatastoreExpandOptions($datastore.ExtensionData.MoRef)
$datastoreSystem.ExpandVmfsDatastore($datastore.ExtensionData.MoRef,$expandOptions.spec)

Write-Output "Datastore: $dstore has been expanded"


