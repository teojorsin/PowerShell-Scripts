# ==== ==== ==== ==== Windows Update Pipelines ==== ==== ==== ====
#
# Stops, Deletes, and Starts the Windows Update Service(s) on Windows.
# Add -PassThru to see what you're doing.
#
# ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ==== ====

Get-Service -Name wuauserv | Stop-Service -PassThru
Get-Service -Name BITS | Stop-Service -PassThru

Remove-Item -Path C:\Windows\SoftwareDistribution\DataStore -Force -Recurse
Remove-Item -Path C:\Windows\SoftwareDistribution\Download -Force -Recurse
Remove-Item -Path C:\Windows\SoftwareDistribution\PostRebootEventCache.V2 -Force -Recurse
Remove-Item -Path C:\Windows\SoftwareDistribution\ReportingEvents.log -Force -Recurse

Get-Service -Name wuauserv | Start-Service -PassThru
Get-Service -Name BITS | Start-Service -PassThru