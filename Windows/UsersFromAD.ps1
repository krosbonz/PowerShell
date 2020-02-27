$Orgs = Get-Content -Path "C:\users\mhauck\Desktop\OUs.txt"
$BasePath = "OU=Users,OU=LGH,DC=LGH,DC=LOCAL"

Foreach ($Org in $Orgs) {
    $Combo = "OU=" + $Org
    $FullPath = $Combo, $BasePath -join ","
    Get-ADUser -Filter * -SearchBase $FullPath -Properties DisplayName, Description | Select-Object DisplayName, Description | Out-File -FilePath "C:\users\mhauck\desktop\$Org.txt"
    $Mgr = Get-ADOrganizationalUnit -Filter * -SearchBase $FullPath -Properties adminDescription | Select-Object -ExpandProperty adminDescription
    $EmailAddy = Get-ADUser -Identity $Mgr -Properties * | Select-Object -ExpandProperty emailaddress
    Send-MailMessage -From "EmployeeList@lawrencegeneral.org" -To $EmailAddy -Subject "Please confirm your direct reports" -Body "Attached is a list of employees in your department. Please confirm all individuals on the list are current and report to you directly. If the attached list is inaccurate please contact Human Resources so corrections can be made." -Attachments "C:\users\mhauck\desktop\$Org.txt" -SmtpServer "mail.lgh.local"
}

