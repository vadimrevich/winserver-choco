$script_path = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$common = $(Join-Path $script_path "common_func.ps1")
. $common

chocolatey-install-exe
