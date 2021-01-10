$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_func.ps1")
. $common

Write-Host "Uninstall Package..."

if( uninstall-msi )
{
	Write-Host "Uninstall complete"
}
else
{
	Write-Host "No any Versions of Pacage " + $packageName + " Found"
}
