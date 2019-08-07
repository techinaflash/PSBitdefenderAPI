function Get-LicenseInfo {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID
    )

    $Options = @{}

    $Options.companyId = $CompanyID

    $ret = Invoke-APIRequest -APIUri $Global:BDLicensingAPIURI -Method "getLicenseInfo" -Options $Options

    return $ret
}