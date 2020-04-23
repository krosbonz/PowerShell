$path = Get-Content "C:\Users\mhauck\Desktop\stuff.txt"
# $newfile = "C:\Users\mhauck\Desktop\stuffNew.txt"

foreach ($line in $path) {
    # Write-Host $line
    if ($line -like '*What if:*') {
        Write-Host
    }
} 
