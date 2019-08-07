function Remove-Company {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID
    )

    $Options = @{}

    $Options.companyId = $CompanyID   

    $ret = Invoke-APIRequest -APIUri $Global:BDCompaniesAPIURI -Method "removeCompany" -Options $Options

    return $ret
}