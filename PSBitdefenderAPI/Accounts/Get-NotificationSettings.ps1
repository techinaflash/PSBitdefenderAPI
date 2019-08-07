function Get-NotificationSettings {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$AccountID = $null
    )

    $Options = @{}

    if ($AccountID) { $Options.accountId = $AccountID }

    $ret = Invoke-APIRequest -APIUri $Global:AccountsAPIURI -Method "getNotificationSettings" -Options $Options

    return $ret   
}