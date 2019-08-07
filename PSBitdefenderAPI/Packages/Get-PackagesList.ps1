function Get-PackagesList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$False)]
        [string]$CompanyID = $null,

        [Parameter(Mandatory=$False)]
        [int]$Page = $null,

        [Parameter(Mandatory=$False)]
        [int]$PerPage = $null
    )

    $Options = @{}

    if ($CompanyID) { $Options.companyId = $CompanyID }
    if ($Page) { $Options.page = $Page }
    if ($PerPage) { $Options.perPage = $PerPage }
    
    $ret = Invoke-APIRequest -APIUri $Global:BDPackagesAPIURI -Method "getPackagesList" -Options $Options

    return $ret
}