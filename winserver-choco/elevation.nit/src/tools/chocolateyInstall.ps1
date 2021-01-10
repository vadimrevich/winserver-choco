$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_func.ps1")
. $common

Write-Host "Uninstall Previous Versions..."

if( uninstall-exe )
{
	Write-Host "Uninstall complete"
}
else
{
	Write-Host "Previos Versions not Found"
}

chocolatey-install-exe

set-path $package_varname
