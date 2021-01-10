$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='Certificates-Install.exe'

$uninstall_folder=$env:UTIL
$make_uninstall_filename='unins000.exe'
$inno_uninstall_filename='unins000.exe'

$packageName = 'certificates.install.nit'
$package_varname="UTIL"
$softwarenamepattern="NIT Certificates Install *"
$packageName1 = 'NIT Certificates Install'
$silentArgs = '/VERYSILENT /NOCANCEL'
$validExitCodes = @(0)
$installerType = 'exe'

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename
$inno_uninstall_file=$uninstall_folder + '\' + $inno_uninstall_filename

$checksum = 'FD84877EE84FEE73EBD3FC4C642F20E5'

$ErrorActionPreference = 'Stop'

