$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='sordum.org.msi'

$uninstall_folder=$env:Util
$make_uninstall_filename='make_uninstall.AdminScripts.cmd'

$package_varname="SystemRoot"
$softwarenamepattern="AdminScripts Set 01"
$packageName = 'sordum.org'
$packageName1 = 'Sordum.Org Utils'
$installerType = 'msi'
$silentArgs = '/norestart /QN'
$validExitCodes = @(0)

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename

$checksum = 'D422D499915747D3D357AE31372A366C'

$ErrorActionPreference = 'Stop'

