function NewBitdefenderPackage {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$PackageName,

        [Parameter(Mandatory=$True)]
        [string]$CompanyID,

        [Parameter(Mandatory=$False)]
        [string]$Description = $null,

        [Parameter(Mandatory=$False)]
        [string]$Language = $null,

        [Parameter(Mandatory=$False)]
        [bool]$ModuleATC = $True,

        [Parameter(Mandatory=$False)]
        [bool]$ModuleFirewall = $True,

        [Parameter(Mandatory=$False)]
        [bool]$ModuleContentControl = $True,

        [Parameter(Mandatory=$False)]
        [bool]$ModuleDeviceControl = $False,

        [Parameter(Mandatory=$False)]
        [bool]$ModulePowerUser = $True,

        [Parameter(Mandatory=$False)]
        [int]$ScanModeType = $null,

        [Parameter(Mandatory=$False)]
        [int]$ScanModeComputersMain = $null,

        [Parameter(Mandatory=$False)]
        [int]$ScanModeComputersFallback = $null,

        [Parameter(Mandatory=$False)]
        [int]$ScanModeVMSMain = $null,

        [Parameter(Mandatory=$False)]
        [int]$ScanModeVMSFallback = $null,

        [Parameter(Mandatory=$False)]
        [int]$ScanModeEC2Main = $null,

        [Paremeter(Mandatory=$False)]
        [int]$ScanModeEC2Fallback = $null,

        [Parameter(Mandatory=$False)]
        [bool]$SettingScanBeforeInstall = $False,

        [Parameter(Mandatory=$False)]
        [string]$SettingUninstallPassword = $null,

        [Parameter(Mandatory=$False)]
        [string]$SettingCustomInstallPath = $null,

        [Parameter(Mandatory=$False)]
        [bool]$RoleRelay = $False,

        [Parameter(Mandatory=$False)]
        [bool]$RoleExchange = $False,

        [Parameter(Mandatory=$False)]
        [int]$DeploymentType = $null,

        [Parameter(Mandatory=$False)]
        [bool]$DeploymentCommProxy = $False,

        [Parameter(Mandatory=$False)]
        [string]$DeploymentProxyServer = $null,

        [Parameter(Mandatory=$False)]
        [int]$DeploymentProxyPort = $null,

        [Parameter(Mandatory=$False)]
        [string]$DeploymentProxyUser = $null,

        [Parameter(Mandatory=$False)]
        [string]$DeploymentProxyPassword = $null
    )

    $Options = @{}
    
    $Options.companyId = $CompanyID
    $Options.packageName = $PackageName
    $Options.modules = @{}
    $Options.scanMode = @{}
    $Options.scanMode.computers = @{}
    $Options.scanMode.vms = @{}
    $Options.scanMode.ec2 = @{}
    $Options.settings = @{}
    $Options.roles = @{}
    $Options.deploymentOptions = @{}

    if ($Description) { $Options.description = $Description }
    if ($Language) { $Options.language = $Language }
    if ($ModuleATC) { $Options.modules.atc = $ModuleATC }
    if ($ModuleFirewall) { $Options.modules.firewall = $ModuleFirewall }
    if ($ModuleContentControl) { $Options.modules.contentControl = $ModuleContentControl }
    if ($ModuleDeviceControl) { $Options.modules.deviceControl = $ModuleDeviceControl }
    if ($ModulePowerUser) { $Options.modules.powerUser = $ModulePowerUser }
    if ($ScanModeType) { $Options.scanMode.type = $ScanModeType }
    if ($ScanModeComputersMain) { $Options.scanMode.computers.main = $ScanModeComputersMain }
    if ($ScanModeComputersFallback) { $Options.scanMode.computers.fallback = $ScanModeComputersFallback }
    if ($ScanModeVMSMain) { $Options.scanMode.vms.main =  $ScanModeVMSMain }
    if ($ScanModeVMSFallback)  { $Options.scanMode.vms.fallback = $ScanModeVMSFallback }
    if ($ScanModeEC2Main) { $Options.scanMode.ec2.main =  $ScanModeEC2Main }
    if ($ScanModeEC2Fallback) { $Options.scanMode.ec2.fallback = $ScanModeEC2Fallback }
    if ($SettingScanBeforeInstall) { $Options.settings.scanBeforeInstall = $SettingScanBeforeInstall }
    if ($SettingUninstallPassword) { $Options.settings.uninstallPassword = $SettingUninstallPassword }
    if ($SettingCustomInstallPath) { $Options.settings.customInstallPath = $SettingCustomInstallPath }
    if ($RoleRelay) { $Options.roles.relay = $RoleRelay }
    if ($RoleExchange) { $Options.roles.exchange = $RoleExchange }
    if ($DeploymentType) { $Options.deploymentOptions.type = $DeploymentType }
    if ($DeploymentRelayID) { $Options.deploymentOptions.relayId = $DeploymentRelayID }
    if ($DeploymentCommProxy) { $Options.deploymentOptions.useCommunicationProxy = $DeploymentCommProxy }
    if ($DeploymentProxyServer) { $Options.deploymentOptions.proxyServer = $DeploymentProxyServer }
    if ($DeploymentProxyPort) { $Options.deploymentOptions.proxyPort = $DeploymentProxyPort }
    if ($DeploymentProxyUser) { $Options.deploymentOptions.proxyUser = $DeploymentProxyUser }
    if ($DeploymentProxyPassword) { $Options.deploymentOptions.proxyPassword = $DeploymentProxyPassword }

    $ret = InvokeBitdefenderAPIRequest -APIUri $Global:BDPackagesAPIURI -Method "createPackage" -Options $Options

    return $ret
}
