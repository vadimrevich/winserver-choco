$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_func.ps1")
. $common

Write-Host "Remooving Package..."

$file0 = $uninstall_folder + '\' + $project_file_00
RemoveOnly-NITPackage $file0

$file1 = $uninstall_folder + '\' + $project_file_01
RemoveOnly-NITPackage $file1
