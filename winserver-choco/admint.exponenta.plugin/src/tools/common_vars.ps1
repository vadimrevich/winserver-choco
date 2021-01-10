$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='AdminTExponentaPluginSetup.exe'

$uninstall_folder=$env:AdminT
$make_uninstall_filename='make_uninstall.AdminScripts.cmd'
$inno_uninstall_filename='unins000.exe'

$packageName = 'admint.exponenta.plugin'
$package_varname="AdminT"
$softwarenamepattern="AdminT Exponenta Plugin *"
$packageName1 = 'AdminT Exponenta Plugin'
$silentArgs = '/VERYSILENT /NOCANCEL'
$validExitCodes = @(0)
$installerType = 'exe'

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename

$checksum = 'F75B224429D9E95114D6C994F0E208F0'

$ErrorActionPreference = 'Stop'

