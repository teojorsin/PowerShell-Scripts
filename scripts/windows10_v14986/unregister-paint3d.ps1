Get-AppxPackage -AllUsers | where-object {$_.name -like "*MSPaint*"} | Remove-AppxPackage
