function Get-CompaniesByName {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$NameFilter
    )

    $Options = @{}

    $Options.nameFilter = $NameFilter

    $ret = Invoke-APIRequest -APIUri $Global:BDCompaniesAPIURI -Method "findCompaniesByName" -Options $Options

    return $ret
}