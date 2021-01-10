$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_func.ps1")
. $common

Write-Host "Downloading..."
$uri0 = $url + $project_file_00
$file0 = $uninstall_folder + '\' + $project_file_00
$dummy = DownloadOnly-NITPackage $uri0 $file0
$dummy1 = has_File $file0 
if( $dummy1 )
{
    Write-Host "Download Success!"
}
else {
    Write-Host "Download Error"
}

$uri1 = $url + $project_file_01
$file1 = $uninstall_folder + '\' + $project_file_01
$dummy = DownloadOnly-NITPackage  $uri1 $file1 
$dummy1 = has_File $file1 
if( $dummy1 )
{
    Write-Host "Download Success!"
}
else {
    Write-Host "Download Error"
}


