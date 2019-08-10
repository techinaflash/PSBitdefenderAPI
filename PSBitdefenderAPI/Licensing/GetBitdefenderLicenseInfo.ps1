function GetBitdefenderLicenseInfo {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID
    )

    $Options = @{}

    $Options.companyId = $CompanyID

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDLicensingAPIURI -Method "getLicenseInfo" -Options $Options

    return $ret
}