$sourceFolder = Join-Path $PSScriptRoot "Source"
Write-Host $PSScriptRoot
Write-Host $sourceFolder

$containerName = Split-Path $PSScriptRoot -Leaf
Write-Host $containerName
Export-ModifiedObjectsAsDeltas -containerName $containerName -deltaFolder $sourceFolder
