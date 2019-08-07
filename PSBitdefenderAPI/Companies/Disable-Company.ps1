function Disable-Company {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID,

        [Parameter(Mandatory=$True)]
        [bool]$Recurse
    )

    $Options = @{}

    $Options.companyId = $CompanyID   
    $Options.recursive = $Recurse

    $ret = Invoke-APIRequest -APIUri $Global:CompaniesAPIURI -Method "suspendCompany" -Options $Options

    return $ret
}