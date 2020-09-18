
Get-ADUser -SearchBase "OU=[Test] User,DC=LGH,DC=LOCAL" -Filter * -Properties * | Where-Object { $_.mail -eq $null } | Select-Object CN, SamAccountName, DistinguishedName, Department | Export-Csv -Path C:\users\mhauck\Desktop\NoEmailUsers.csv
