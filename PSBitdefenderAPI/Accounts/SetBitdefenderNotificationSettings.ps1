function SetBitdefenderNotificationSettings {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$False)]
        [string]$AccountID = $null,

        [Parameter(Mandatory=$False)]
        [int]$DeleteAfter = $null,

        [Parameter(Mandatory=$False)]
        [array]$EmailAddresses = $null,

        [Parameter(Mandatory=$False)]
        [bool]$IncludeDeviceName = $null,

        [Parameter(Mandatory=$False)]
        [bool]$IncludeDeviceFQDN = $null


    )

    $Options = @{}


    return $ret   
}