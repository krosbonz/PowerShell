   Add-PSSnapin vmware.vimautomation.core
   
   connect-viserver lgh-vc01.lgh.local -protocol https
   
    
    $choice = Read-Host 'Press 1 to select a VM or Press 2 to select a Cluster.'

    switch ($choice)
    {
        1 {
           $vmName = Read-Host 'Please type in a VM name to reset CBT on.'

            $vmInfo = Get-vm $vmName
            $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $spec.ChangeTrackingEnabled = $false


            $vmInfo.ExtensionData.ReconfigVM($spec)
            $snap=$vmInfo | New-Snapshot -Name 'Disable CBT'
            $snap | Remove-Snapshot -confirm:$false
        }
        2 {
            $vmName = Read-Host 'Please type in a Cluster name to reset CBT on.'

            $vmInfo = Get-Cluster $vmName | Get-VM
            $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $spec.ChangeTrackingEnabled = $false


            $vmInfo.ExtensionData.ReconfigVM($spec)
            $snap=$vmInfo | New-Snapshot -Name 'Disable CBT'
            $snap | Remove-Snapshot -confirm:$false
        }
        default {Write-host 'Invaild Input, exiting...'}
    }    

