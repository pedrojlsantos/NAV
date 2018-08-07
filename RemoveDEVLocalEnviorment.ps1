Param(
     #[Parameter(Mandatory=$True)]
     [string]$containerName
     )

Write-Host "********************* Starting Delete Of NAV Container *************************" -ForegroundColor Yellow
Write-Host "containerName - $containerName"

docker stop $containerName
echo 'Remove NAV Container'
Remove-NavContainer -containerName $containerName

Write-Host "********************* END Delete Of NAV Container ******************************" -ForegroundColor Green