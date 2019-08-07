function Get-InstallationLinks {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$False)]
        [string]$CompanyID = $null,

        [Parameter(Mandatory=$False)]
        [string]$PackageName = $null
    )

    $Options = @{}

    if ($CompanyID) { $Options.companyId = $CompanyID }
    if ($PackageName) { $Options.packageName = $PackageName }

    $ret = Invoke-APIRequest -APIUri $Global:BDPackagesAPIURI -Method "getInstallationLinks" -Options $Options

    return $ret
}