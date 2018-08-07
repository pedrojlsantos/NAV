Param(
    [Parameter(Mandatory=$true)]
    [String]$containerName,
    [Parameter(Mandatory=$true)]
    [String]$sourceFolder,
    [String]$DEVLicence = ''
)

write-host "********************* Start Create NAV dev Container *************************" -ForegroundColor Yellow
Write-Host "containerName $containerName 
sourceFolder $sourceFolder"

IF($DEVLicence -eq ''){
    New-CSideDevContainer `
        -accept_eula `
        -containerName $containerName `
        -imageName microsoft/dynamics-nav:2018-au `
        -doNotExportObjectsToText `
        -memoryLimit 3G `
        -updateHosts `
        -auth Windows `
        -Verbose `
        -additionalParameters @("--volume ${sourceFolder}:${sourceFolder}") 
                               # "--volume ${ExtensionsFolder}:${ExtensionsFolder}") 
}
ELSE{
    New-CSideDevContainer `
        -accept_eula `
        -containerName $containerName `
        -imageName microsoft/dynamics-nav:2018-au `
        -licenseFile $DEVLicence
        -memoryLimit 3G `
        -updateHosts `
        -auth Windows `
        -Verbose `
        -additionalParameters @("--volume ${sourceFolder}:${sourceFolder}") 
}

write-host "********************* Start Create NAV dev Container *************************" -ForegroundColor Green