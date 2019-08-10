function SetBitdefenderLicenseKey {
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

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDLicensingAPIURI -Method "setLicenseKey" -Options $Options

    return $ret   
}