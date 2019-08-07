function Get-CompanyDetails {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID
    )

    $Options = @{}

    $Options.companyId = $CompanyID

    $ret = Invoke-APIRequest -APIUri $Global:CompaniesAPIURI -Method "getCompanyDetails" -Options $Options

    return $ret
}