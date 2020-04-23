<#
.Synopsis
    
.Description
    
.EXAMPLE
    
.Example
    
#>

# Script Name
# Creator
# Date
# Update
# References

# Variables

# Parameters



if ($global:DefaultVIServer -eq $null) {
    # Write-Host "No connected vCenter server"
    $vCenter = Read-Host -Prompt "Enter your vCenter server name"
    $user = Read-Host -Prompt "Enter user name"
    $pass = Read-Host -Prompt "Enter password" -AsSecureString
    $plainPwd = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Pass))
    Connect-VIServer $VCenter -User $user -Password $plainPwd
}

