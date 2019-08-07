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
        $errors.Count | Should Be 0
    }

    It "Module '$moduleName' can import cleanly" {
        {Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should Not Throw
    }
}

Describe "Testing the internal authorization function:" {

	InModuleScope PSCloudberryAPI{
	
		It "Removing CloudberryAccessToken:"{
			If (!$Global:Cloudberry_Access_Token){
				Set-Variable -Name "Cloudberry_Access_Token" -Value 'test' -Option ReadOnly -Scope global -Force
			}
			Remove-CloudberryAccessToken
			$Global:Cloudberry_Access_Token | Should -Be $null
			#resets cloudberry access token so the rest of the tests can commence, maybe move this test to the end
			#Get-CloudberryAccessToken -Admin_Username $env:CBUSERNAME -Admin_Password $env:CBPASSWORD
		}
		
		It "Getting CloudberryAccessToken:" {
			Get-CloudberryAccessToken -Admin_Username $env:CBUSERNAME -Admin_Password $env:CBPASSWORD
			$Global:Cloudberry_Access_Token | Should -Not -Be $null 
		}
		
		It "Getting User List:" {
			GetCloudberryUserList | Should -Not -Be $null
			
		}
		
		It "Getting Account List:" {
			GetCloudberryAccountList | Should -Not -Be $null
		}
		
		It "Getting Destination for test user:" {
			GetCloudberryDestination -Email 'matthew@techinaflash.net' | Should -Not -Be $null
		}
		
		It "Creating test user and removing it:" {
			$userid = CreateCloudberryUser -Email 'test@test.com' -Password 'test1234' -Enabled 'true'
			Write-Verbose "Create User .... UserID: $userid"			
			$userid | Should -Match '-' -Because 'could not create test user'
			RemoveCloudberryUser -ID $userid | Should -Not -Be $null -Because 'could not remove test user'
		
		}
		It "Getting Company List:" {
			GetCloudberryCompanyList | Should -Not -Be $null
		}
		It "Creating test Company and removing it:" {
			$result = CreateCloudberryCompany -Name 'Test' -StorageLimit 0 -LicenseSettings 2 
			Write-Verbose "Create Company result ... $result"
			$result | Should -Not -Be $null
			RemoveCloudberryCompany -ID $result | Should -Not -Be $null -Because 'could not remove test company'
		
		}
		It "Getting Available License List:" {
			$liceneses = GetCloudberryLicenseList -IsAvailable $true
			Write-Verbose "Cloudberry License List ... $liceneses"
			$liceneses | Should -Not -Be $null
		}
		
		
	}
}