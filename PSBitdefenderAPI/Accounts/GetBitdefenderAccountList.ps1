function GetBitdefenderAccountList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$False)]
        [string]$CompanyID = $null,

        [Parameter(Mandatory=$False)]
        [string]$Page = $null,

        [Parameter(Mandatory=$False)]
        [string]$PerPage = $null
    )

    $Options = @{}

    if ($CompanyID) { $Options.companyId = $CompanyID }
    if ($Page) { $Options.page = $Page }
    if ($Page) { $Options.perPage = $PerPage }

    $ret = Invoke-APIRequest -APIUri $Global:BDAccountsAPIURI -Method "getAccountList" -Options $Options

    return $ret   
}