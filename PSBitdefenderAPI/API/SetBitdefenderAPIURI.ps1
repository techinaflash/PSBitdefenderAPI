function SetBitdefenderAPIURI {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$URI
    )

    $Global:BDBaseAPIURI = $URI
}