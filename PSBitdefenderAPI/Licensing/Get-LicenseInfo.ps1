function Get-LicenseInfo {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID
    )

    $Options = @{}

    $Options.companyId = $CompanyID

    $ret = Invoke-APIRequest -APIUri $Global:LicensingAPIURI -Method "getLicenseInfo" -Options $Options

    return $ret
}