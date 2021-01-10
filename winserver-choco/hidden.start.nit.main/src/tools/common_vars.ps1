$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='HiddenStartSetupRePack.exe'

$uninstall_folder=$env:PUB1
$make_uninstall_filename='unins000.exe'
$inno_uninstall_filename='unins000.exe'

$packageName = 'hidden.start.nit.main'
$package_varname="Hidden Start"
$softwarenamepattern="Hidden Start *"
$packageName1 = 'Hidden Start'
$silentArgs = '/VERYSILENT /NOCANCEL'
$validExitCodes = @(0)
$installerType = 'exe'

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename
$inno_uninstall_file=$uninstall_folder + '\' + $inno_uninstall_filename

$checksum = '285C493EFC1DE2BC190B492330B63575'

$ErrorActionPreference = 'Stop'

