function Set-MonthlySubscription {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID,

        [Parameter(Mandatory=$False)]
        [int]$ReservedSlots = $null,

        [Parameter(Mandatory=$False)]
        [bool]$ManageExchange = $null,

        [Parameter(Mandatory=$False)]
        [bool]$ManageEncryption = $null
    )

    $Options = @{}

    $Options.companyId = $CompanyID

    if ($ReservedSlots) { $Options.reservedSlots = $ReservedSlots }
    if ($ManageExchange) { $Options.manageExchange = $ManageExchange }
    if ($ManageEncryption) { $Options.manageEncryption = $ManageEncryption }

    $ret = Invoke-APIRequest -APIUri $Global:BDLicensingAPIURI -Method "setMonthlyEncryption" -Options $Options

    return $ret   
}