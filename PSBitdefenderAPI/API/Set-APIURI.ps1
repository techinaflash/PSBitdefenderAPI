function Set-APIURI {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$URI
    )

    $Global:BaseAPIURI = $URI
}