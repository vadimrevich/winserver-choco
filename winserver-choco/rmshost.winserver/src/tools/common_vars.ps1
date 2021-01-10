$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='rms.host.6.10.ru_winserver.msi'

$uninstall_folder=$env:Util
$make_uninstall_filename='make_uninstall.AdminScripts.cmd'

$package_varname="SystemRoot"
$softwarenamepattern="Remote Manipulator System *"
$packageName = 'rmshost.winserver'
$packageName1 = 'Remote Manipulator System - Host'
$installerType = 'msi'
$silentArgs = '/norestart /QN'
$validExitCodes = @(0)

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename

$checksum = 'F8079EC62B539953ABAA8D5E6C63F544'

$ErrorActionPreference = 'Stop'

