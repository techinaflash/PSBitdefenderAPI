function Set-APIKey {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$APIKey
    )

    $Global:APIKey = $APIKey
}