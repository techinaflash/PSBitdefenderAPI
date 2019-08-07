function Get-MonthlyUsage {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID,

        [Parameter(Mandatory=$True)]
        [string]$TargetMonth
    )

    $Options = @{}

    $Options.companyId = $companyID
    $Options.targetMonth = $TargetMonth

    $ret = Invoke-APIRequest -APIUri $Global:BDLicensingAPIURI -Method "getMonthlyUsage" -Options $Options

    return $ret
}