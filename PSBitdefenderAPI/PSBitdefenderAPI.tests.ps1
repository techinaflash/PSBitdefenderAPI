#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests. 
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#
$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psm1")
$moduleName = Split-Path $moduleRoot -Leaf
$PSDefaultParameterValues['*:Verbose'] = $true


Describe "General project validation: $moduleName" {
    $scripts = Get-ChildItem $projectRoot -Include *.ps1,*.psm1,*.psd1 -Recurse

    # TestCases are splatted to the script so we need hashtables
    $testCase = $scripts | Foreach-Object{@{file=$_}}         
    It "Script <file> should be valid powershell" -TestCases $testCase {
        param($file)

        $file.fullname | Should Exist

        $contents = Get-Content -Path $file.fullname -ErrorAction Stop
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)
		#if($errors.Count -gt 0){
			#foreach($err in $errors){Write-Verbose "***ERROR***: $($err.Message)"}
		#}
        $errors.Count | Should Be 0
    }

    It "Module '$moduleName' can import cleanly" {
        {Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should Not Throw
    }
}

Describe "Testing the internal authorization function:" {

	InModuleScope PSBitdefenderAPI{
	
		It "Removing BitdefenderAPIKey:"{
			If (!$Global:BitdefenderAPIKey){
				Set-Variable -Name "BitdefenderAPIKey" -Value 'test' -Option ReadOnly -Scope global -Force
			}
			RemoveBitdefenderAPIKey
			$Global:BitdefenderAPIKey | Should -Be $null
			#Creates BitdefenderAPIKey Global variable as a test and removes
		}
		It "Setting BitdefenderAPIKey:" {
			SetBitdefenderAPIKey -APIKey $env:APIKEY
			$Global:BitdefenderAPIKey | Should -Not -Be $null 
		}
		
		
		
		
	}
}