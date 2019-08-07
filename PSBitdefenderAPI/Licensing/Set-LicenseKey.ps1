function Set-LicenseKey {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$LicenseKey,

        [Parameter(Mandatory=$False)]
        [string]$CompanyID = $null
    )

    $Options = @{}

    $Options.licenseKey = $LicenseKey

    if ($CompanyID) { $Options.companyId = $CompanyID }

    $ret = Invoke-APIRequest -APIUri $Global:LicensingAPIURI -Method "setLicenseKey" -Options $Options

    return $ret   
}