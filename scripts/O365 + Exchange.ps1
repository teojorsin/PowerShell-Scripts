#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#          Connect to office 365 and exchange online using a script
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Use at your own risk 

$Loop = $true
While ($Loop) {
	Write-Host
	Write-Host ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	Write-Host       Connect to Office 365 and Exchange online    -ForegroundColor green
	Write-Host ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	Write-Host
	Write-Host '    Connect PowerShell session to Office 365 and Exchange on-line' -ForegroundColor green
	Write-Host '    ---------------------------------------------------------------' -ForegroundColor green
	Write-Host '1)  Login using your Office365 Administrator credentials' -ForegroundColor Yellow
	Write-Host
	Write-Host
	Write-Host "2)  Disconnect from the Remote PowerShell session" -ForegroundColor Red
	Write-Host
	Write-Host "3)  Exit" -ForegroundColor Red
	Write-Host

	$opt = Read-Host "Select an option [1-3]"
	Write-Host $opt
	switch ($opt) {

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# Step -00 connect PowerShell session to Office 365 and Exchange online
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

					1{

#  administrative user credentials 

						$user = “@jorsin.se”

# Display authentication pop out windows

						$cred = Get-Credential -Credential $user

#——– Import office 365 Cmdlets  ———–

						Import-Module MSOnline

#———— Establish an Remote PowerShell Session to office 365 ———————

						Connect-MsolService -Credential $cred

#———— Establish an Remote PowerShell Session to Exchange Online ———————

						$msoExchangeURL = “https://outlook.office365.com/powershell-liveid/”

						$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $msoExchangeURL -Credential $cred -Authentication Basic -AllowRedirection 

#———— This command that we use for implicit remoting feature of PowerShell 2.0 ———————

						Import-PSSession $session

#———— Indication ———————
						Write-Host
							if ($lastexitcode -eq 1) {
								Write-Host "The command Failed :-(" -ForegroundColor red
								Write-Host "Try to connect again and check your credentials" -ForegroundColor red
							} else {
								Clear-Host

								Write-Host
								Write-Host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                        
													 
								Write-Host  -ForegroundColor white  	"The command complete successfully!" 
								Write-Host  -ForegroundColor white  	"You are now connected to office 365 and Exchnage online"
								Write-Host  -ForegroundColor white  	"You can chose the option “3” to leave the menu screen and start managing: "
								Write-Host  -ForegroundColor white  	"Office 365 + Exchange online environments"
								Write-Host  -ForegroundColor white	    --------------------------------------------------------------------   
								Write-Host  -ForegroundColor white  	"Test the connection to Exchange online by using the command  Get-MailBox"
								Write-Host  -ForegroundColor white  	"Test the connection to Office 365 by using the command  Get-MsolUser".
	
								Write-Host  -ForegroundColor green	ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo                                         
								Write-Host
								Write-Host
								Write-Host  -ForegroundColor Yellow
								Write-Host  -ForegroundColor Yellow
							}

#———— End of Indication ———————

					}

#+++++++++++++++++++
#  Finish  
##++++++++++++++++++
 
					2{

##########################################
# Disconnect PowerShell session  
##########################################


						Get-PSSession | Remove-PSSession

#Function Disconnect-ExchangeOnline {Get-PSSession | Where-Object {$_.ConfigurationName -eq "Microsoft.Exchange"} | Remove-PSSession}
#Disconnect-ExchangeOnline -confirm

#———— Indication ———————
						Write-Host
							if ($lastexitcode -eq 1) {
								Write-Host "The command Failed :-(" -ForegroundColor red
								Write-Host "Try to connect again and check your credentials" -ForegroundColor red
							} else {
								Write-Host "The command complete successfully !" -ForegroundColor Yellow
								Write-Host "The remote PowerShell session to Exchange online was disconnected" -ForegroundColor Yellow
							}

#———— End of Indication ———————

					}
					3{

##########################################
# Exit 
##########################################

						$Loop = $true
						Exit
					}
			}
}