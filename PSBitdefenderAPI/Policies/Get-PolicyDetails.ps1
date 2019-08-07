function Get-PoliciesList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$PolicyID
    )

    $Options = @{}

    $Options.policyId = $PolicyID

    $ret = Invoke-APIRequest -APIUri $Global:BDPoliciesAPIURI -Method "getPolicyDetails" -Options $Options

    return $ret   
}