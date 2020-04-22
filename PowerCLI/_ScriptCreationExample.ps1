# Script requirements

Param (
    [Parameter(Mandatory=$true)] # Mandatory=True sets the paramater to be a requirement
    [string[]] # Means the mandatory param is a sting. Additional [] after string denotes this param accepts multiple inputs
    $Computername # Just an example of what the mandatory parm could be. Must be used in the script
)

$Services = Get-Service -ComputerName $Computername

Foreach ($service in $services) {
    $ServiceStatus = $service.Status # Here status is a property of Get-Service.
    $ServiceDisplayName = $Service.Name

    if ($ServiceStatus -eq 'Running') {
        Write-Output "Service OK - Status of $ServiceDisplayName is $ServiceStatus"
    }
    Else {
        Write-Output "Check Service - Status of $ServiceDisplayName is $ServiceStatus"
    }
}