$Global:APIKey = $null
$Global:SyncroAPIKey = $null

$Global:BaseAPIURI = "https://cloud.gravityzone.bitdefender.com/api/"
$Global:SyncroAPIURI  "http://techinaflash.syncromsp.com/api/v1/"
$Global:AccountsAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/accounts"
$Global:CompaniesAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/companies"
$Global:IntegrationsAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/integrations"
$Global:LicensingAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/licensing"
$Global:NetworkAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/network"
$Global:PackagesAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/packages"
$Global:PoliciesAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/policies"
$Global:PushAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/push"
$Global:ReportsAPIURI = $Global:BaseAPIURI + "v1.0/jsonrpc/reports"
$Global:SyncroCompaniesAPIURI = $Global:SyncroAPIURI + "companies"

