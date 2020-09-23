
$path = '\\lgh-files1.lgh.local\L$'
$Creds = Get-Credential
get-childitem $path -Depth 100 -Include RECOVER-FILES.txt -ErrorAction SilentlyContinue | Select Directory | Export-CSV C:\Users\mhauck\Desktop\ransdir_cpacs0.txt

$dirs = Get-ChildItem -Path $Path -Depth 0 -Directory | Sort-Object


$Path = "C:\Users\mhauck\Documents"
$dirs = Get-ChildItem -Path $Path -Depth 0 -Directory
$stuffs = $dirs.FullName

foreach ($stuff in $stuffs) {
    if (Test-Path -Path $stuff\RECOVER-FILES.txt) {
        Add-Content C:\Users\mhauck\Desktop\sample.txt "$stuff"
    }
}