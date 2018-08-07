Param(
    [String]$containerName = "NAV-DEV",
    [String]$sourceFolder = '',
    [String]$baseDemoLicenceFile,
    [String]$licenseFile,
    [String]$DEVlicenceFile = '',
    [string]$NAVMainVersion = "NAV2018"
)

Write-Host "******************** Start deploy of DEV enviorment **************************" -ForegroundColor Yellow


if ($sourceFolder -eq '') {
    $sourceFolder = Join-Path $PSScriptRoot "\$NAVMainVersion"
}

$navversion = ''
$suffix = ''
$licenseFileToUse = $licenseFile

write-host 'Create source local folder'
mkdir $sourceFolder -Force

.\CreateDEVContainer.ps1 -containerName $containerName `
                         -sourceFolder $sourceFolder

.\ExportOriginals.ps1 -containerName $containerName `
                        -sourceFolder $sourceFolder `
                        -baseLicenceFile $baseDemoLicenceFile `
                        -licenseFile $licenseFile `
                        -DEVLicenceFile $DEVlicenceFile

IF($DEVlicenceFile -ne ""){
    $licenseFileToUse = $DEVlicenceFile
}


$deltaFolder = Join-Path $sourceFolder "Modified"
.\ImportDeltasToContainer.ps1 -containerName $containerName `
                              -sourceFolder $deltaFolder `
                              -LicenceFile $licenseFileToUse


Write-Host "******************** END deploy of DEV enviorment **************************" -ForegroundColor Green