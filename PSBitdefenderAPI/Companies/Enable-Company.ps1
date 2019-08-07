function Enable-Company {
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

    $ret = Invoke-APIRequest -APIUri $Global:CompaniesAPIURI -Method "activateCompany" -Options $Options

    return $ret
}