param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Install-Module Psake, PSDeploy, BuildHelpers  -AllowClobber -Scope CurrentUser
Install-Module Pester -MinimumVersion 4.1  -AllowClobber -SkipPublisherCheck -Scope CurrentUser
Import-Module Psake, BuildHelpers

Set-BuildEnvironment -ErrorAction SilentlyContinue
Remove-Module PSCloudberryAPI
uninstall-module PSCloudberryAPI
Remove-Variable Cloudberry_Access_Token -force

Invoke-psake -buildFile .\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )
