function GetBitdefenderPoliciesList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$PolicyID
    )

    $Options = @{}

    $Options.policyId = $PolicyID

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDPoliciesAPIURI -Method "getPolicyDetails" -Options $Options

    return $ret   
}