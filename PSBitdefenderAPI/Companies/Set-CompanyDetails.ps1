function New-Company {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$CompanyID,

        [Parameter(Mandatory=$False)]
        [int]$Type = $null,

        [Parameter(Mandatory=$False)]
        [string]$Name = $null,

        [Parameter(Mandatory=$False)]
        [string]$Address = $null,

        [Parameter(Mandatory=$False)]
        [string]$Phone = $null
    )

    $Options = @{}
    $Options.compantId = $CompanyID

    if ($Type) { $Options.type = $Type }
    if ($Name) { $Options.name = $Name }
    if ($Address) { $Options.address = $Address }

    $ret = Invoke-APIRequest -APIUri $Global:CompaniesAPIURI -Method "updateCompanyDetails" -Options $Options

    return $ret
}