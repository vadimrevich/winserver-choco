$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_vars.ps1")
. $common

function Get-Processor-Bit( $Bits )
{
    $cpu_info = Get-WmiObject -class Win32_Processor
    foreach ($cpu_values in $cpu_info) {
        $xcpu = $cpu_values.Architecture
        if( $Bits -eq 32 -and $xcpu -eq 0 ){
            return $true
        }
        if( $Bits -eq 64 -and $xcpu -eq 9 ){
            return $true
        }
    }
    return $false
}

function use64bit($Forcei586 = $false) {
    if ($Forcei586) {
        return $false
    }
    if (Test-Path (Join-Path $script_path "i586.txt")) {
        return $false
    }
    $is64bitOS = Get-Processor-Bit 64
    return $is64bitOS
}

function has_file($filename) {
    return Test-Path $filename
}

function get-programfilesdir( $cond = $false ) {
    if ((use64bit $cond) -or (Get-Processor-Bit 32)) {
        $programFiles = (Get-Item "Env:ProgramFiles").Value
    } else {
        $programFiles = (Get-Item "Env:ProgramFiles(x86)").Value
    }

    return $programFiles
}

function get-utildir() {

    if( Test-Path "Env:Util" )
    {
         $utildir = (Get-Item "Env:Util").Value
    }
    else
    {
         $utildir = "C:\Util"
    }
    return $utildir
}

function get-pub1dir() {

    if( Test-Path "Env:PUB!" )
    {
         $utildir = (Get-Item "Env:PUB1").Value
    }
    else
    {
         $utildir = "C:\pub1"
    }
    return $utildir
}

function get-elevationdir() {

    if( Test-Path "Env:Elevation" )
    {
         $utildir = (Get-Item "Env:Elevation").Value
    }
    else
    {
         $utildir = "C:\Elevation"
    }
    return $utildir
}

function get-admintdir() {

    if( Test-Path "Env:AdminT" )
    {
         $utildir = (Get-Item "Env:AdminT").Value
    }
    else
    {
         $utildir = "C:\Elevation"
    }
    return $utildir
}

function download-file-from-tuneserv($url, $output_filename) {
    if (-not (has_file($output_fileName))) {
        Write-Host  "Downloading file from $url ..."
        $client = New-Object Net.WebClient
        $dummy = $client.DownloadFile($url, $output_filename)
    }
}

function download-from($url, $output_filename) {
    $dummy = download-file-from-tuneserv $url $output_filename
}

function download-file($url, $filename, $Forcei586 = $false) {
    $arch = get-arch $Forcei586
    $output_filename = Join-Path $script_path $filename

    $dummy = download-from $url $output_filename

    return $output_filename
}

function get-install-path( $A_Path, $cond = $false ) {

    if($A_Path -eq "PUB1")
    {
        $program_files = get-pub1dir
    }
    if($A_Path -eq "ELEVATION")
    {
        $program_files = get-elevationdir
    }
    elseif( $A_Path -eq "AdminT" )
    {
        $program_files = get-admintdir
    }
    elseif($A_Path -eq "Util" )
    {
        $program_files = get-utildir
    }
    else
    {
        $programfiles = get-programfilesdir( $cond )
        $program_files = Join-Path $programfiles $A_Path
    }

    return $program_files
}

function get-arch($Forcei586 = $false) {
    if((use64bit $Forcei586)) {
        return "x64"
    } else {
        return "i586"
    }
}

function chocolatey-install-msi() {
    $packageArgs = @{
        packageName    = $packageName
        unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
        fileType       = $installerType
        url            = $url
        silentArgs     = $silentArgs
        validExitCodes = @(0)
        softwareName   = $packageName1
        checksum       = $checksum
        checksumType   = 'md5'
    }
    Install-ChocolateyPackage @packageArgs
}

function chocolatey-install-exe( $Forcei586 = $false) {
    $file = download-file $url $project_file $Forcei586
    $arch = get-arch $Forcei586
    $file_home = get-install-path $package_varname $Forcei586
    $install_options = $silentArgs
    $ErrorActionPreference = 'Stop'

    $packageArgs = @{
  packageName    = $packageName
  fileType       = $installerType
  file           = $file
  silentArgs     = $silentArgs
  softwareName   = $packageName1
  checksum       = $checksum
  checksumType   = 'md5'
  validExitCodes = @(0)
    }
    Install-ChocolateyInstallPackage @packageArgs
    Remove-Item "$file" -ea 0
    $packageName = $packageArgs.packageName
    $installLocation = Get-AppInstallLocation $packageName
    if (!$installLocation) { 
        Write-Warning "Can't find $PackageName install location" 
        return 
    }
    Write-Host "$packageName installed to '$installLocation'"
}

function set-path( $A_Path ) {
    $a_home = get-install-path $A_Path
    Install-ChocolateyPath $a_home 'Machine'

    Install-ChocolateyEnvironmentVariable $A_Path $a_home 'Machine'
}

function uninstall-msi(){
    $all_programs = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
    if( $all_programs -match $packageName1 )
    {
	    (Get-WmiObject Win32_Product -Filter "Name='$packageName1'").Uninstall()
	    Write-Host "Uninstall complete"
        return $true
    }
    else
    {
        return $false
    }
}

function uninstall-exe(){
    $key = Get-UninstallRegistryKey $softwareNamePattern
    if ($key.Count -eq 1) {
        $key | ForEach-Object {
            $packageArgs = @{
                packageName            = $packageName
                silentArgs             = "/x86=0 "+$silentArgs
                fileType               = 'EXE'
                validExitCodes         = @(0)
                file                   = ''
            }
            $packageArgs.file = "$($_.UninstallString.Replace(' /x86=0', ''))"   #"C:\Program Files\OpenSSH\uninstall.exe" /x86=0
            Uninstall-ChocolateyPackage @packageArgs
            Write-Host $packageName + " successfully uninstalled from disk"
        }
        return $true
    }
    elseif ($key.Count -eq 0)
    {
	    Write-Host "Installation not Found"
    }
    elseif ($key.Count -gt 1) {
        Write-Warning "$key.Count matches found!"
        Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
        Write-Warning "Please alert package maintainer the following keys were matched:"
        $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
    }
    return $false
}

function uninstall-inno(){
    $a_home = get-install-path $package_varname
    $inno_uninstall_file = $a_home + '\' + $inno_uninstall_filename
    if ( has_File( $inno_uninstall_file ) ) {
        #&$inno_uninstall_file $silentArgs
            $packageArgs = @{
                packageName            = $packageName
                silentArgs             = $silentArgs
                fileType               = 'EXE'
                validExitCodes         = @(0)
                file                   = $inno_uninstall_file
            }
            Uninstall-ChocolateyPackage @packageArgs
            Write-Host $packageName + " successfully uninstalled from disk"
        return $true
    }
    else
    {
	    Write-Host "Installation not Found"
        return $false
    }
}

function DownloadOnly-NITPackage( $url, $output_filename ) {
    if( has_File($output_filename)) {
        Write-Host "File " $output_filename " already Exist. Delete It"
        Remove-Item $output_filename -Force
    }
    Write-Host "Starting download from " $url " to " $output_filename "..."
    $dummy = download-from $url $output_filename
    return $dummy
}

function RemoveOnly-NITPackage( $output_filename ) {
    if( has_File($output_filename)) {
        Write-Host "Remove File " $output_filename "..."
        Remove-Item $output_filename -Force
    }
}

## Test InnoUninstall
#$a_home = get-install-path $package_varname
#$inno_uninstall_file = $a_home + '\' + $inno_uninstall_filename
#Echo $inno_uninstall_file
#has_file( $inno_uninstall_file )
