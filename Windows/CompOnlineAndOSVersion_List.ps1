$Computers = Get-Content -Path "C:\users\mhauck\Desktop\computers.txt"

Foreach ($Computer in $Computers) { $OS =
    if (Test-Connection -ComputerName $Computer -Quiet -Count 1) {
        (Get-WmiObject -Class Win32_OperatingSystem -cn $Computer | Format-List -Property CSName, BuildNumber | Out-String).Trim()
        # The out-string with Trim removes extra lines
    }
    else {
        Write-Host "$Computer is offline"
    }
    $OS | Out-File -FilePath "C:\Users\mhauck\Desktop\computer_ver.txt" 
}