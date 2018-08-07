Param(
    [Parameter(Mandatory=$true)]
    [String]$containerName,
    [Parameter(Mandatory=$true)]
    [String]$sourceFolder,
    [string]$LicenceFile
)

Write-Host "********************* Starting import of Deltas *************************" -ForegroundColor Yellow
Write-Host "containerName - $containerName"
Write-Host "sourceFolder - $sourceFolder"
Write-Host "LicenceFile - $LicenceFile"

IF($LicenceFile -ne ""){
    Import-NavContainerLicense -containerName $containerName -licenseFile $LicenceFile
}

write-host 'Import Changes to NAV DEV container'
Import-DeltasToNavContainer -containerName $containerName -deltaFolder $sourceFolder -compile