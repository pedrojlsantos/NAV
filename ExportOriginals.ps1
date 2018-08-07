Param(
    [Parameter(Mandatory=$true)]
    [String]$containerName,
    [Parameter(Mandatory=$true)]
    [String]$sourceFolder,
    [String]$baseLicenceFile,
    [String]$licenseFile,
    [string]$DEVLicenceFile
)

Write-Host "******************** Start exporting Originals ******************************" -ForegroundColor Yellow
Write-Host "containerName - $containerName"
Write-Host "sourceFolder - $sourceFolder"
Write-Host "baseLicenceFile - $baseLicenceFile"
Write-Host "licenseFile - $licenseFile"
Write-Host "DEVLicenceFile -$DEVLicenceFile"

$navversion = Get-NavContainerNavVersion $containerName

$originalFolder = Join-Path "c:\programdata\navcontainerhelper\extensions" "Original-$navversion"


if(Test-Path -Path "$sourceFolder\Original-$navversion"){
    write-Host "Original folder for Github  $sourceFolder\Original-$navversion already exist. Original Export skiped"
}
ELSE{

    IF($DEVLicenceFile -eq '') {
        Write-Host "Importing licence $licenseFile"
        Import-NavContainerLicense -containerName $containerName -licenseFile $licenseFile
    }

    write-host "creatre baseline for GitHub $sqlCredential"
    Export-NavContainerObjects -containerName $containerName `
                                -objectsFolder "$sourceFolder\Original-$navversion" `
                                -filter "" `
                                -sqlCredential $sqlCredential
}

if(Test-Path -Path $originalFolder){
    write-Host "Original folder $originalFolder already exist. Copy Export skiped"
}
ELSE{

    Write-Host "Copy $originalFolder to source $sourceFolder"
    Copy-Item -Path $sourceFolder -Destination $originalFolder
}
