$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_func.ps1")
. $common

&choco uninstall -y NIT-DESECURE
&choco uninstall -y sordum.org
&choco uninstall -y nit.hs.cmd.utils
& $make_uninstall_file
Write-Host "Uninstall Package..."

if( uninstall-exe )
{
	Write-Host "Uninstall complete"
}
else
{
	Write-Host "No any Versions of Package " + $packageName + " Found"
}
& C:\rm.util.cmd
Remove-Item C:\rm.util.cmd


