$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='ExponentaMainFilesSetup.exe'

$uninstall_folder=$env:PUB1
$make_uninstall_filename='unins000.exe'
$inno_uninstall_filename='unins001.exe'

$packageName = 'exponenta.main.files'
$package_varname="PUB1"
$softwarenamepattern="Exponenta Admin Packages Main Files *"
$packageName1 = 'Exponenta Admin Packages Main Files'
$silentArgs = '/VERYSILENT /NOCANCEL'
$validExitCodes = @(0)
$installerType = 'exe'

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename
$inno_uninstall_file=$uninstall_folder + '\' + $inno_uninstall_filename

$checksum = '6AC0378FEE9E89C3B0F9DABCCC83839D'

$ErrorActionPreference = 'Stop'

