$containerName = 'NAV2018-DEVT2'
$sourceFolder = 'C:\source\NAV-Test\NAV2018'
$licenseFile =  'C:\temp\MS.flf'

Import-NavContainerLicense -containerName $containerName -licenseFile $licenseFile

echo 'Import ALL Changes to NAV DEV container'
#Import-ObjectsToNavContainer -containerName $containerName -objectsFile $sourceFolder'\*\'

echo 'Import Changes to NAV DEV container'
Import-DeltasToNavContainer -containerName $containerName -deltaFolder $sourceFolder -compile