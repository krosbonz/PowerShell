$Svr = Get-Content 'C:\temp\Computers.txt'

$ScriptBlock = {
    $MaxSize = (Get-PartitionSupportedSize -DriveLetter C).Sizemax

    Resize-Partition -DriveLetter C -Size $MaxSize
}

Invoke-Command -ComputerName $Svr -ScriptBlock $ScriptBlock


