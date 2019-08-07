# Import all module Powershell scripts
Get-ChildItem $PSScriptRoot\*.ps1 -Recurse | % { . $_.FullName }