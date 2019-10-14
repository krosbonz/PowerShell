# ==============================================================================================
# 
# Microsoft PowerShell Source File -- Created with SAPIEN Technologies PrimalScript 2009
# 
# NAME: 
# 
# AUTHOR: Keith Luken
# DATE  : 7/10/2013
# 
# COMMENT: 
# 
# ==============================================================================================
# ==============================================================================================
# * Software Dependencies: *
# - Microsoft PowerShell *
# - VMWare PowerCLI *
# 
Write-Host This will set enable/disable vm console copy/paste functionality
$vcenter = Read-Host "Enter the FQN of the vcenter:"
$vmname = Read-Host "Enter the VM name:"
$action = Read-Host "Enter Y to enable N to disable:"

if ($action -eq "Y") {
	$copy = New-Object VMware.Vim.optionvalue
	$copy.Key="isolation.tools.copy.disable"
	$copy.Value="FALSE"
	$paste = New-Object VMware.Vim.optionvalue
	$paste.Key="isolation.tools.paste.disable"
	$paste.Value="FALSE"
	$text = "Enabling copy/paste for VM: " + $vmname
} elseif ($action -eq "N") {
	$copy = New-Object VMware.Vim.optionvalue
	$copy.Key="isolation.tools.copy.disable"
	$copy.Value="TRUE"
	$paste = New-Object VMware.Vim.optionvalue
	$paste.Key="isolation.tools.paste.disable"
	$paste.Value="TRUE"
	$text = "Disabling copy/paste for VM: " + $vmname
} else {

	Write-Host `nSorry you did not enter a valid entry ...`n
	exit
	
}

Clear-Host
Write-Host
write-host The following parameters will be used:`n
write-host vcenter FQDN:`t $vcenter
write-host VM name:`t	$vmname
Write-Host `nLoading Powercli....`n

#Try {Add-PSSnapin VMware.VimAutomation.Core}
Try {Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue}
Catch
{
	$ErrorMessage = $_.Exception.Message
	Write-Host "Error encountered adding Powercli :" $ErrorMessage
	Exit $exitcode
	
}
Write-Host Connecting to $vcenter "please wait...."`n
connect-viserver -server $vcenter 

#Create a Machine Config Spec using the three option values specified above
$vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
$vmConfigSpec.extraconfig += $copy
$vmConfigSpec.extraconfig += $paste

Write-Host `n $text

$vm = get-view -viewtype virtualmachine |where {$_.name -eq $vmname}
$vm.ReconfigVM($vmConfigSpec)

Write-Host `n
Write-Host Disconnecting from $vcenter "please wait...."
disconnect-VIServer -Server $vcenter -Confirm:$false


Exit $exitcode
Write-Host End of script.

