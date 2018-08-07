Write-Host "force scripts to run"
Set-ExecutionPolicy RemoteSigned -force

Write-Host "install navcontainerhelper"
install-module navcontainerhelper -force

Write-Host "import navcontainerhelper"
Import-Module navcontainerhelper
Write-NavContainerHelperWelcomeText