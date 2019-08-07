function Set-SyncroAPIKey {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$APIKey
    )

    $Global:SyncroAPIKey = $APIKey
}