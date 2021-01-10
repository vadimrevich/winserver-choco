$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='Scripts.Set01.msi'

$uninstall_folder=$env:SystemRoot
$make_uninstall_filename='make_uninstall.AdminScripts.cmd'

$package_varname="SystemRoot"
$softwarenamepattern="AdminScripts Set 01"
$packageName = 'adminset01.nit'
$packageName1 = 'AdminScripts Set 01'
$installerType = 'msi'
$silentArgs = '/norestart /QN'
$validExitCodes = @(0)

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename

$checksum = 'BBB0A7C779168269431BA4D3AD1F2D71'

$ErrorActionPreference = 'Stop'

