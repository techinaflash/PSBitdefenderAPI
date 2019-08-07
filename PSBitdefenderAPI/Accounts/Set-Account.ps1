function Set-Account {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$AccountID,

        [Parameter(Mandatory=$False)]
        [string]$Email = $null,

        [Parameter(Mandatory=$True)]
        [string]$ProfileFullName,

        [Parameter(Mandatory=$False)]
        [string]$ProfileTimeZone = $null,

        [Parameter(Mandatory=$False)]
        [string]$ProfileLanguage = $null,

        [Parameter(Mandatory=$False)]
        [string]$Password = $null,

        [Parameter(Mandatory=$False)]
        [int]$Role = $null,

        [Parameter(Mandatory=$False)]
        [bool]$RightsManageCompanies = $null,

        [Parameter(Mandatory=$False)]
        [bool]$RightsManageNetworks = $null,

        [Parameter(Mandatory=$False)]
        [bool]$RightsManageReports = $null,

        [Parameter(Mandatory=$False)]
        [bool]$RightsManageUsers = $null,

        [Parameter(Mandatory=$False)]
        [bool]$RightsCompanyManager = $null,

        [Parameter(Mandatory=$False)
        [array]$TargetIDs = $null
    )

    $Options = @{}
    $Options.profile = @{}
    $Options.rights = @{}

    $Options.companyId = $CompanyID
    $Options.profile.fullName = $ProfileFullName

    if ($ProfileTimeZone) { $Options.profile.timeZone = $ProfileTimeZone }
    if ($ProfileLanguage) { $Options.profile.language = $ProfileLanguage }
    if ($Password) { $Options.password = $Password }
    if ($Role) { $Options.role = $Role }
    if ($RightsManageCompanies) { $Options.rights.manageCompanies = $RightsManageCompanies }
    if ($RightsManageNetworks) { $Options.rights.manageNetworks = $RightsManageNetworks }
    if ($RightsManageReports) { $Options.rights.manageReports = $RightsManageReports }
    if ($RightsManageUsers) { $Options.rights.manageUsers = $RightsManageUsers }
    if ($RightsCompanyManager) { $Options.rights.companyManager = $RightsCompanyManager }
    if ($TargetIDs) { $Options.targetIds = $TargetIDs }

    $ret = Invoke-APIRequest -APIUri $Global:AccountsAPIURI -Method "updateAccount" -Options $Options

    return $ret   
}