# Lists the total count of cmdlets on the current machine.
# Pretty simple.

$numberofcmdlets = (Get-Command).count
$comp = $env:COMPUTERNAME

Write-Host "There are a total of $numberofcmdlets on $comp."