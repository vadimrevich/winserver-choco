$packageName1 = 'Nit Desecure'

Write-Host "Uninstall..."
$all_programs = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
if( $all_programs -match $packageName1 )
{
	(Get-WmiObject Win32_Product -Filter "Name='$packageName1'").Uninstall()
	Write-Host "Uninstall complete"
}
else
{
	Write-Host "Installation not Found"
}
