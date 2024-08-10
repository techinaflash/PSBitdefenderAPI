function NewBitdefenderCompany {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [int]$Type,

        [Parameter(Mandatory=$True)]
        [string]$Name,

        [Parameter(Mandatory=$False)]
        [string]$ParentID = $null,

        [Parameter(Mandatory=$False)]
        [string]$Address = $null,

        [Parameter(Mandatory=$False)]
        [string]$Phone = $null,

        [Parameter(Mandatory=$False)]
        [bool]$ManagedByParent,

        [Parameter(Mandatory=$False)]
        [string]$AccountEmail = $null,

        [Parameter(Mandatory=$False)]
        [string]$AccountFullName = $null,

        [Parameter(Mandatory=$False)]
        [string]$AccountTimeZone = $null,

        [Parameter(Mandatory=$False)]
        [string]$AccountLanguage = $null,

        [Parameter(Mandatory=$False)]
        [int]$LicenseType = $null,

        [Parameter(Mandatory=$False)]
        [string]$LicenseKey = $null,

        [Parameter(Mandatory=$False)]
        [int]$LicenseReservedSlots = $null,

        [Parameter(Mandatory=$False)]
        [bool]$LicenseExchange = $false,

        [Parameter(Mandatory=$False)]
        [bool]$LicenseEncryption = $false
    )

    $Options = @{}
    $Options.licenseSubscription = @{}

    $Options.type = $Type
    $Options.name = $Name

    if ($ParentID) { $Options.parentId = $ParentID }
    if ($Address) { $Options.address = $Address }
    if ($Phone) { $Options.phone = $Phone }
    if ($ManagedByParent) { $Options.canBeManagedByOver = $ManagedByParent }
    if ($AccountEmail) { $Options.accountEmail = $AccountEmail }
    if ($AccountFullName) { $Options.accountFullName = $AccountFullName }
    if ($AccountTimeZone) { $Options.accountTimeZone = $AccountTimeZone }
    if ($AccountLanguage) { $Options.accountLanguage = $AccountEmail }
    if ($LicenseType) { $Options.licenseSubscription.type = $LicenseType }
    if ($LicenseKey) { $Options.licenseSubscription.licenseKey = $LicenseKey }
    if ($LicenseReservedSlots) { $Options.licenseSubscription.reservedSlots = $LicenseReservedSlots }
    if ($LicenseExchange) { $Options.licenseSubscription.manageExchange = $LicenseExchange }
    if ($LicenseEncryption) { $Options.licenseSubscription.manageEncryption = $LicenseEncryption }

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDCompaniesAPIURI -Method "createCompany" -Options $Options

    return $ret
}
