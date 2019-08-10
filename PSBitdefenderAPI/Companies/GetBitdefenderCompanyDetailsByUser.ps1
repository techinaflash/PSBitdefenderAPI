function GetBitdefenderCompanyDetailsByUser {
    [CmdletBInding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Username,

        [Parameter(Mandatory=$True)]
        [String]$Password
    )

    $Options = @{}

    $Options.username = $Username
    $Options.password = $Password

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDCompaniesAPIURI -Method "getCompanyDetailsByUser" -Options $Options

    return $ret
}