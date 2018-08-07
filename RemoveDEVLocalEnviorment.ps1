Param(
     #[Parameter(Mandatory=$True)]
     [string]$containerName
     )

docker stop $containerName
echo 'Remove NAV Container'
Remove-NavContainer -containerName $containerName