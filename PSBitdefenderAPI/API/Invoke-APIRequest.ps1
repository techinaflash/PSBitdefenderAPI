function Invoke-APIRequest {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$False)]
        [string]$APIKey = $Global:$BitdefenderAPIKey,

        [Parameter(Mandatory=$True)]
        [string]$APIUri,

        [Parameter(Mandatory=$True)]
        [string]$Method,

        [Parameter(Mandatory=$True)]
        [object]$Options,

        [Parameter(Mandatory=$False)]
        [string]$JSONRPC = "2.0",

        [Parameter(Mandatory=$False)]
        [int]$RequestID = 1
    )

    if (!$APIKey) {
        throw "API Key has not been set. Please use SetBitdefenderAPIKey before calling this function."
    } else {
        $Auth = "$($APIKey):$($null)"
        $AuthEnc = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($Auth))
        $AuthHeader = "Basic $AuthEnc"
    
        $Headers = @{
            Authorization = $AuthHeader
        }
    
        $Body = @{
            id = $RequestID
            jsonrpc = $JSONRPC
            method = $Method
            params = $Options
        } | ConvertTo-Json
    
        $Response = Invoke-RestMethod -Method Post -Uri $APIUri -Headers $Headers -Body $Body -ContentType "application/json"
    
        return $Response
    }
}