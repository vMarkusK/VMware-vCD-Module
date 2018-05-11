Function New-MyExternalNetwork {
<#
.DESCRIPTION
    Creates a new External Network with Default QSC P3NG Parameters

.NOTES
    File Name  : New-MyExternalNetwork.ps1
    Author     : Markus Kraus
    Version    : 1.0
    State      : Ready

.LINK
    https://mycloudrevolution.com/

.EXAMPLE
    $params = @{ 'name' = 'MyTest';
             'vCenterName'='MyVcenter';
             'PortGroupName'='MyTest';
             'SubnetMask' = '255.255.255.0';
             'Gateway' = '192.168.110.1';
             'IPRangeStart' = '192.168.110.100';
             'IPRangeEnd' = '192.168.110.200'
             }
    New-MyExternalNetwork @params

.PARAMETER Name
    Name of the New Org Network as String

.PARAMETER vCenterName
    Name of the vCenter (vCD Config) as String

.PARAMETER PortGroupName
    Name of the DV PortGroup as String

.PARAMETER SubnetMask
     Subnet Mask of the New External Network as IP Address

.PARAMETER Gateway
     Gateway of the New External Network as IP Address

.PARAMETER IPRangeStart
    IP Range Start of the New External Network as IP Address

.PARAMETER IPRangeEnd
     IP Range End of the New External Network as IP Address

.PARAMETER Timeout
    Timeout for the External Network to become Ready

    Default: 120s

#>
    Param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Name of the New External Network as String")]
        [ValidateNotNullorEmpty()]
            [String] $Name,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Name of the vCenter (vCD Config) as String")]
        [ValidateNotNullorEmpty()]
            [String] $vCenterName,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Name of the DV PortGroup as String")]
        [ValidateNotNullorEmpty()]
            [String] $PortGroupName,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Subnet Mask of the New External Network as IP Address")]
        [ValidateNotNullorEmpty()]
            [IPAddress] $SubnetMask,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Gateway of the New External Network as IP Address")]
        [ValidateNotNullorEmpty()]
            [IPAddress] $Gateway,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="IP Range Start the New External Network as IP Address")]
        [ValidateNotNullorEmpty()]
            [IPAddress] $IPRangeStart,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="IP Range End the New External Network as IP Address")]
        [ValidateNotNullorEmpty()]
            [IPAddress] $IPRangeEnd,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False,HelpMessage="Timeout for the External Network to become Ready")]
        [ValidateNotNullorEmpty()]
            [int] $Timeout = 120
    )

    Process {

    ## Get vCenter
    Write-Verbose "Get vCenter Reference"
    [Array]$vCenterRef = Search-Cloud VirtualCenter | Get-CIView | Where-Object {$_.name -eq $vCenterName}

    if ( $vCenterRef.Count -gt 1) {
        throw "Multiple vCenters found!"
        }
        elseif ( $vCenterRef.Count -lt 1) {
            throw "No vCenter found!"
            }

    Write-Verbose "Get PortGroup Reference"
    [Array]$PortGroup = Get-View -ViewType DistributedVirtualPortGroup | Where-Object {$_.name -like $PortGroupName}

    if ( $PortGroup.Count -gt 1) {
        throw "Multiple PortGroups found!"
        }
        elseif ( $PortGroup.Count -lt 1) {
            throw "No PortGroup found!"
            }

    ## Define External Network
    Write-Verbose "Define External Network"
    $ExternalNetwork = new-object vmware.vimautomation.cloud.views.VMWExternalNetwork
    $ExternalNetwork.Name = $Name
    $ExternalNetwork.VimPortGroupRef = new-object VMware.VimAutomation.Cloud.Views.VimObjectRef
    $ExternalNetwork.VimPortGroupRef.MoRef = $PortGroup.key
    $ExternalNetwork.VimPortGroupRef.VimObjectType = "DV_PORTGROUP"

    $ExternalNetwork.VimPortGroupRef.VimServerRef = new-object VMware.VimAutomation.Cloud.Views.Reference
    $ExternalNetwork.VimPortGroupRef.VimServerRef.href = $vCenterRef.href
    $ExternalNetwork.VimPortGroupRef.VimServerRef.type = "application/vnd.vmware.admin.vmwvirtualcenter+xml"

    $ExternalNetwork.Configuration = new-object VMware.VimAutomation.Cloud.Views.NetworkConfiguration
    $ExternalNetwork.configuration.fencemode = "isolated"

    $ExternalNetwork.Configuration.IpScopes = new-object VMware.VimAutomation.Cloud.Views.IpScopes
    $ExternalNetwork.Configuration.IpScopes.IpScope = new-object VMware.VimAutomation.Cloud.Views.IpScope
    $ExternalNetwork.Configuration.IpScopes.ipscope[0].Gateway = $Gateway
    $ExternalNetwork.Configuration.IpScopes.ipscope[0].Netmask = $SubnetMask
    $ExternalNetwork.Configuration.IpScopes.ipscope[0].IsInherited = "False"

    $ExternalNetwork.Configuration.IpScopes.ipscope[0].ipranges = new-object vmware.vimautomation.cloud.views.ipranges
    $ExternalNetwork.Configuration.Ipscopes.ipscope[0].ipranges.iprange = new-object vmware.vimautomation.cloud.views.iprange
    $ExternalNetwork.Configuration.IpScopes.ipscope[0].IpRanges.IpRange[0].startaddress = $IPRangeStart
    $ExternalNetwork.Configuration.IpScopes.ipscope[0].IpRanges.IpRange[0].endaddress = $IPRangeEnd

    ## Create External Network
    Write-Verbose "Create External Network"
    $vCloud = $DefaultCIServers[0].ExtensionData
    $Admin = $vCloud.GetAdmin()
    $Ext = $Admin.GetExtension()
    $CreateExternalNetwork = $Ext.CreateExternalNet($ExternalNetwork)

    ## Wait for External Network to become Ready
    Write-Verbose "Wait for External Network to become Ready"
    while(!(Get-ExternalNetwork -Id $CreateExternalNetwork.Id -ErrorAction SilentlyContinue)){
        $i++
        Start-Sleep 5
        if($i -gt $Timeout) { Write-Error "Creating External Network."; break}
        Write-Progress -Activity "Creating External Network" -Status "Wait for External Network to become Ready..."
    }
    Write-Progress -Activity "Creating External Network" -Completed
    Start-Sleep 1

    Get-ExternalNetwork -Id $CreateExternalNetwork.Id | Select-Object Name, VlanId, Gateway, UsedIpCount, TotalIpCount  | Format-Table -AutoSize

    }
}
