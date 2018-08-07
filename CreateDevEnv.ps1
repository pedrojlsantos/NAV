Param(
    [String]$containerName,
    [String]$sourceFolder,
    [String]$baseLicenceFile,
    [String]$licenseFile
)

write-host 'Create NAV dev Container'
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

$navversion = Get-NavContainerNavVersion $containerName
        
Import-NavContainerLicense -containerName $containerName -licenseFile $licenseFile

write-host 'creatre baseline - not needed with NAV 2018 licence'
Export-NavContainerObjects -containerName $containerName `
                            -objectsFolder "$sourceFolder\Original-$navversion$suffix" `
                            -filter "" `
                            -sqlCredential $sqlCredential

write-host 'Import Changes to NAV DEV container'
Import-DeltasToNavContainer -containerName $containerName -deltaFolder $sourceFolder -compile

Import-NavContainerLicense -containerName $containerName -licenseFile $baseLicenceFile

<#
$mylicense = "c:\temp\mylicense.flf"
$imageName = "microsoft/dynamics-nav:2017-cu13"
$sourceFolder = Join-Path $PSScriptRoot "Source"
$containerName = Split-Path $PSScriptRoot -Leaf
New-NavContainer -accept_eula `
                 -containerName $containerName `
                 -imageName $imageName `
                 -auth Windows `
                 -licensefile $mylicense `
                 -updateHosts `
                 -includeCSide `
                 -additionalParameters @("--volume ${sourceFolder}:c:\source") 
Import-DeltasToNavContainer -containerName $containerName -deltaFolder $sourceFolder -compile
#>