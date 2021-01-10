$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file='ElevationSetupRepack.exe'

$uninstall_folder=$env:ELEVATION
$make_uninstall_filename='make_uninstall.AdminScripts.cmd'

$packageName = 'elevation.nit'
$package_varname="ELEVATION"
$softwarenamepattern="Elevation *"
$packageName1 = 'Elevation Exponenta Plugin'
$silentArgs = '/VERYSILENT /NOCANCEL'
$validExitCodes = @(0)
$installerType = 'exe'

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder + $project_file
$make_uninstall_file=$uninstall_folder + '\' + $make_uninstall_filename

$checksum = '4A7EF805C299ADCC9E17D198E93DF552'

$ErrorActionPreference = 'Stop'

