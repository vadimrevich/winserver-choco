$http_prefix='http'
$host_domain='dummy.mydomen.com'
$http_port='80'
$project_folder='/Exponenta/'
$project_file_00='kms.tools-2019.zip'
$project_file_01='KMS_Tools.zip'

$uninstall_folder=$env:USERPROFILE

$packageName = 'kms-tools-download'
$packageName1 = 'KMS Tools by Ratibor'

$url = $http_prefix + '://' + $host_domain + ':' + $http_port + $project_folder

$ErrorActionPreference = 'Stop'

