$Path = 'C:\Test\'
$Items = Get-ChildItem -Path $path | Group-Object -Property folder

Foreach ($ItemsGroup in $Items) {
    $SortedFiles = $ItemsGroup.Group | sort LastWriteTime -Descending
    $SortedFiles | Select-Object -Skip 2 | % { Remove-Item -Recurse -Force -Confirm:$false $_.FullName }
}