import-module ActiveDirectory
# Find computers created 90 days ago
$time = (get-date).AddDays(-45)
$comp = Get-ADComputer -Filter { createTimeStamp -gt $time  } -Properties *
$comp | Format-Table name,LastLogonDate,IPv4Address,enabled,CanonicalName -AutoSize
$comp | Select-Object name,LastLogonDate,IPv4Address,enabled,CanonicalName | Out-GridView