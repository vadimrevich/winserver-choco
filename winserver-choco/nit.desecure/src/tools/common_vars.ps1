$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/choco/'
$project_file='NIT.DESECURE.msi'

$uninstall_folder=$env:Util
$make_uninstall_filename='make_uninstall.AdminScripts.cmd'

$package_varname="Util"
$softwarenamepattern="Nit Desecure"
$packageName = 'NIT.DESECURE'
$packageName1 = 'Nit Desecure'
$installerType = 'msi'
$silentArgs = '/norestart /QN'
$validExitCodes = @(0)

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename

$checksum = '28A6ADB86A294B0E0E59D61CA6700D35'

$ErrorActionPreference = 'Stop'

