$Computers = Get-ADComputer -Filter * -SearchBase 'OU=Test PCs,OU=IS Apps,OU=Computers,OU=LGH,DC=LGH,DC=LOCAL' | Select -exp Name

Foreach ($Computer in $Computers) {
    if (Test-Connection -ComputerName $Computer) {
        Get-WmiObject -Class Win32_OperatingSystem -cn $Computer| Format-List -Property CSName, BuildNumber
    }
    else {
        Write-Host "$Computer.Name is offline"
    }
}