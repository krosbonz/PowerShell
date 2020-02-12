$Path = 'C:\Temp\securadyne'
$Items = Get-ChildItem -Path $path\*.zip, $path\*.csv, $path\diff*.dar, $Path\full*.dar, $Path\diff*.sign, $Path\full*.sign -Recurse | Group-Object -Property extension

Foreach ($ItemsGroup in $Items) {
    $SortedFiles = $ItemsGroup.Group | sort LastWriteTime -Descending
    $SortedFiles | Select-Object -Skip 2 | % { Remove-Item $_.FullName }
}
write