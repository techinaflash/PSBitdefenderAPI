function GetBitdefenderMonthlyUsage {
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

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDLicensingAPIURI -Method "getMonthlyUsage" -Options $Options

    return $ret
}