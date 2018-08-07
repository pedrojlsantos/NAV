Param(
    [String]$containerName,
    [String]$sourceFolder,
    [String]$baseLicenceFile,
    [String]$licenseFile,
    [string]$DEVLicenceFile
)

Write-Host "Start exporting Originals"

$navversion = Get-NavContainerNavVersion $containerName

        
Import-NavContainerLicense -containerName $containerName -licenseFile $licenseFile

if(Test-Path -Path "$sourceFolder\Original-$navversion"){
    write-Host "Original folder $sourceFolder\Original-$navversion already exist. Original Export skiped"
}
ELSE {
    write-host "creatre baseline - not needed with NAV 2018 licence $sqlCredential"
    Export-NavContainerObjects -containerName $containerName `
                                -objectsFolder "$sourceFolder\Original-$navversion" `
                                -filter "" `
                                -sqlCredential $sqlCredential
}

write-host 'Import Changes to NAV DEV container'
Import-DeltasToNavContainer -containerName $containerName -deltaFolder $sourceFolder -compile

if($licenseFile -ne $baseLicenceFile){
    Import-NavContainerLicense -containerName $containerName -licenseFile $baseLicenceFile
}
