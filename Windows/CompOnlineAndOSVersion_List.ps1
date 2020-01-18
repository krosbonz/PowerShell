$Computers = Get-Content -Path "C:\users\mhauck\Desktop\computers.txt"

Foreach ($Computer in $Computers) {
    #Write-Host $Computer
    if (Test-Connection -ComputerName $Computer -Quiet -Count 1) {
        Get-WmiObject -Class Win32_OperatingSystem -cn $Computer | Format-List -Property CSName, BuildNumber
    }
    else {
        Write-Host "$Computer is offline"
    }
}