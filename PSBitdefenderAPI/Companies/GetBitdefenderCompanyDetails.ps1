function GetBitdefenderCompanyDetails {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID
    )

    $Options = @{}

    $Options.companyId = $CompanyID

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDCompaniesAPIURI -Method "getCompanyDetails" -Options $Options

    return $ret
}