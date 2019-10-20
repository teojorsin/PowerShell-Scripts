$loc = (Get-AppxPackage -AllUsers | where-object {$_.name -like "*MSPaint*"} | select InstallLocation).InstallLocation+"\AppxManifest.xml"
Add-AppxPackage -register $loc -DisableDevelopmentMode