$vm = get-vm -name lgh-psc1-test

Get-View $vm -Property Name, Config.LatencySensitivity | Select Name, @{N = 'Sensitivity Level'; E = { $_.Config.LatencySensitivity.Level}}