function GetBitdefenderCompaniesByName {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$NameFilter
    )

    $Options = @{}

    $Options.nameFilter = $NameFilter

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDCompaniesAPIURI -Method "findCompaniesByName" -Options $Options

    return $ret
}