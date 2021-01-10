$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_func.ps1")
. $common

Write-Host "Uninstall Previous Versions..."

if( uninstall-msi )
{
	Write-Host "Uninstall complete"
}
else
{
	Write-Host "Previos Versions not Found"
}

chocolatey-install-msi
