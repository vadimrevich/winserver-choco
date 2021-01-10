$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='UtilPackSetup.exe'

$uninstall_folder=$env:UTIL
$make_uninstall_filename='make_uninstall.UTIL.cmd'

$packageName = 'utils-pack.nit'
$package_varname="Utils Pack"
$softwarenamepattern="Utils Pack *"
$packageName1 = 'Utils Pack'
$silentArgs = '/VERYSILENT /NOCANCEL'
$validExitCodes = @(0)
$installerType = 'exe'

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename

$checksum = 'ADD838936972940F12734A170B62238B'

$ErrorActionPreference = 'Stop'

