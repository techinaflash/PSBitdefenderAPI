function RemoveBitdefenderAccount {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$AccountID
    )

    $Options = @{}

    $Options.accountId = $AccountID

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDPoliciesAPIURI -Method "deleteAccount" -Options $Options

    return $ret   
}