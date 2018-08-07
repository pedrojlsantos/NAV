Param(
    [Parameter(Mandatory=$true)]
    [String]$containerName,
    [String]$sourceFolder,
    [String]$baseLicenceFile,
    [String]$licenseFile
)

$navversion = Get-NavContainerNavVersion $containerName
$sourceFolder = Join-Path $PSScriptRoot "\NAV2018\Modified"

Write-Host "************************ Start Export changes **************************" -ForegroundColor Yellow
write-host "NAV version - $navversion"
Write-Host "Container - $containerName"
Write-Host "Original path - $ExtensionsFolder"
Export-ModifiedObjectsAsDeltas -containerName $containerName -deltaFolder $sourceFolder
#Export-NavContainerObjects -containerName NAV2018-DEVT2 -objectsFolder $sourceFolder -exportTo "txt folder"

Write-Host "************************ Start Export changes **************************" -ForegroundColor Green