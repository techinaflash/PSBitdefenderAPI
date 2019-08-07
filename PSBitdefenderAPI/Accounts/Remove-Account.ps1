function Remove-Account {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$AccountID
    )

    $Options = @{}

    $Options.accountId = $AccountID

    $ret = Invoke-APIRequest -APIUri $Global:PoliciesAPIURI -Method "deleteAccount" -Options $Options

    return $ret   
}