New Commands
=========================

This page contains details on **New** commands.

New-MyEdgeGateway
-------------------------


NAME
    New-MyEdgeGateway
    
SYNOPSIS
    Creates a new Edge Gateway with Default Parameters
    
    
SYNTAX
    New-MyEdgeGateway [-Name] <String> [-OrgVdcName] <String> [-OrgName] <String> [-ExternalNetwork] <String> [-IPAddress] <IPAddress> [-SubnetMask] <IPAddress> [-Gateway] 
    <IPAddress> [-IPRangeStart] <IPAddress> [-IPRangeEnd] <IPAddress> [[-Timeout] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    Creates a new Edge Gateway with Default Parameters
    
    Default Parameters are:
    * Size
    * HA State
    * DNS Relay
    

PARAMETERS
    -Name <String>
        Name of the New Edge Gateway as String
        
    -OrgVdcName <String>
        OrgVDC where the new Edge Gateway should be created as string
        
    -OrgName <String>
        Org where the new Edge Gateway should be created as string
        
    -ExternalNetwork <String>
        External Network of the new Edge Gateway as String
        
    -IPAddress <IPAddress>
        IP Address of the New Edge Gateway as IP Address
        
    -SubnetMask <IPAddress>
        Subnet Mask of the New Edge Gateway as IP Address
        
    -Gateway <IPAddress>
        Gateway of the New Edge Gateway as IP Address
        
    -IPRangeStart <IPAddress>
        Sub Allocation IP Range Start of the New Edge Gateway as IP Address
        
    -IPRangeEnd <IPAddress>
        Sub Allocation IP Range End of the New Edge Gateway as IP Address
        
    -Timeout <Int32>
        Timeout for the Edge Gateway to get Ready
        
        Default: 120s
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>New-MyEdgeGateway -Name "TestEdge" -OrgVDCName "TestVDC" -OrgName "TestOrg" -ExternalNetwork "ExternalNetwork" -IPAddress "192.168.100.1" -SubnetMask 
    "255.255.255.0" -Gateway "192.168.100.254" -IPRangeStart ""192.168.100.2" -IPRangeEnd ""192.168.100.3" -Verbose
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help New-MyEdgeGateway -examples".
    For more information, type: "get-help New-MyEdgeGateway -detailed".
    For technical information, type: "get-help New-MyEdgeGateway -full".
    For online help, type: "get-help New-MyEdgeGateway -online"


New-MyOrg
-------------------------

NAME
    New-MyOrg
    
SYNOPSIS
    Creates a new vCD Org with Default Parameters
    
    
SYNTAX
    New-MyOrg [-Name] <String> [-FullName] <String> [[-Description] <String>] [-Enabled] [<CommonParameters>]
    
    
DESCRIPTION
    Creates a new vCD Org with Default Parameters.
    
    Default Parameters are:
    * Catalog Publishing
    * Catalog Subscription
    * VM Quota
    * Stored VM Quota
    * VM Lease Time
    * Stored VM Lease Time
    * Password Policy Settings
    

PARAMETERS
    -Name <String>
        Name of the New Org as String
        
    -FullName <String>
        Full Name of the New Org as String
        
    -Description <String>
        Description of the New Org as String
        
    -Enabled [<SwitchParameter>]
        Should the New Org be enabled after creation
        
        Default:$false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>New-MyOrg -Name "TestOrg" -FullName "Test Org" -Description "PowerCLI Test Org"
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help New-MyOrg -examples".
    For more information, type: "get-help New-MyOrg -detailed".
    For technical information, type: "get-help New-MyOrg -full".
    For online help, type: "get-help New-MyOrg -online"


New-MyOrgAdmin
-------------------------

NAME
    New-MyOrgAdmin
    
SYNOPSIS
    Creates a new vCD Org Admin with Default Parameters
    
    
SYNTAX
    New-MyOrgAdmin [-Name] <String> [-Pasword] <String> [-FullName] <String> [-EmailAddress] <String> [-Org] <String> [-Enabled] [<CommonParameters>]
    
    
DESCRIPTION
    Creates a new vCD Org Admin with Default Parameters
    
    Default Parameters are:
    * User Role
    

PARAMETERS
    -Name <String>
        Name of the New Org Admin as String
        
    -Pasword <String>
        
    -FullName <String>
        Full Name of the New Org Admin as String
        
    -EmailAddress <String>
        EmailAddress of the New Org Admin as String
        
    -Org <String>
        Org where the new Org Admin should be created as string
        
    -Enabled [<SwitchParameter>]
        Should the New Org be enabled after creation
        
        Default:$false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>New-MyOrgAdmin -Name "OrgAdmin" -Pasword "Anfang!!" -FullName "Org Admin" -EmailAddress "OrgAdmin@TestOrg.local" -Org "TestOrg"
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help New-MyOrgAdmin -examples".
    For more information, type: "get-help New-MyOrgAdmin -detailed".
    For technical information, type: "get-help New-MyOrgAdmin -full".
    For online help, type: "get-help New-MyOrgAdmin -online"


New-MyOrgNetwork
-------------------------

NAME
    New-MyOrgNetwork
    
SYNOPSIS
    Creates a new Org Network with Default Parameters
    
    
SYNTAX
    New-MyOrgNetwork [-Name] <String> [-OrgVdcName] <String> [-OrgName] <String> [-EdgeName] <String> [-SubnetMask] <IPAddress> [-Gateway] <IPAddress> [-IPRangeStart] 
    <IPAddress> [-IPRangeEnd] <IPAddress> [[-Shared] <Boolean>] [[-Timeout] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    

PARAMETERS
    -Name <String>
        Name of the New Org Network as String
        
    -OrgVdcName <String>
        OrgVDC where the new Org Network should be created as string
        
    -OrgName <String>
        Org where the newOrg Networkshould be created as string
        
    -EdgeName <String>
        Edge Gateway Name for the new Org Network as String
        
    -SubnetMask <IPAddress>
        Subnet Mask of the New Org Network as IP Address
        
    -Gateway <IPAddress>
        Gateway of the New Org Network as IP Address
        
    -IPRangeStart <IPAddress>
        IP Range Start of the New Org Network as IP Address
        
    -IPRangeEnd <IPAddress>
        IP Range End of the New Org Network as IP Address
        
    -Shared <Boolean>
        Switch for Shared OrgVDC Network
        
        Default: $True
        
    -Timeout <Int32>
        Timeout for the Org Network to become Ready
        
        Default: 120s
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>New-MyOrgNetwork -Name Test -OrgVdcName "Test-OrgVDC" -OrgName "Test-Org" -EdgeName "Test-OrgEdge" -SubnetMask 255.255.255.0 -Gateway 192.168.66.1 -IPRangeStart 
    192.168.66.100 -IPRangeEnd 192.168.66.200
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>New-MyOrgNetwork -Name Test -OrgVdcName "Test-OrgVDC" -OrgName "Test-Org" -EdgeName "Test-OrgEdge" -SubnetMask 255.255.255.0 -Gateway 192.168.66.1 -IPRangeStart 
    192.168.66.100 -IPRangeEnd 192.168.66.200 -Shared:$False
    
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>$params = @{ 'Name' = 'Test';
    
    'OrgVdcName'= 'Test-OrgVDC';
                'OrgName'='Test-Org';
                'EdgeName'='Test-OrgEdge';
                'SubnetMask' = '255.255.255.0';
                'Gateway' = '192.168.66.1';
                'IPRangeStart' = '192.168.66.100';
                'IPRangeEnd' = '192.168.66.200'
                }
    New-MyOrgNetwork @params -Verbose
    
    
    
    
REMARKS
    To see the examples, type: "get-help New-MyOrgNetwork -examples".
    For more information, type: "get-help New-MyOrgNetwork -detailed".
    For technical information, type: "get-help New-MyOrgNetwork -full".
    For online help, type: "get-help New-MyOrgNetwork -online"


New-MyOrgVdc
-------------------------

NAME
    New-MyOrgVdc
    
SYNOPSIS
    Creates a new vCD Org VDC with Default Parameters
    
    
SYNTAX
    New-MyOrgVdc [-Name] <String> [-CPULimit] <Int32> [-MEMLimit] <Int32> [-StorageLimit] <Int32> [-StorageProfile] <String> [-NetworkPool] <String> [[-ExternalNetwork] 
    <String>] [-Enabled] [-ProviderVDC] <String> [-Org] <String> [[-Timeout] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    Creates a new vCD Org VDC with Default Parameters
    
    Default Parameters are:
    * Allocation Model
    * Network Quota
    * VM Quota
    * 'vCpu In Mhz'
    * Fast Provisioning
    * Thin Provisioning
    * private Catalog
    

PARAMETERS
    -Name <String>
        Name of the New Org VDC as String
        
    -CPULimit <Int32>
        CPU Limit (MHz) of the New Org VDC as String
        
    -MEMLimit <Int32>
        Memory Limit (MB) of the New Org VDC as String
        
    -StorageLimit <Int32>
        Storage Limit (MB) of the New Org VDC as String
        
    -StorageProfile <String>
        Storage Profile of the New Org VDC as String
        
    -NetworkPool <String>
        Network Pool of the New Org VDC as String
        
    -ExternalNetwork <String>
        Optional External Network of the New Org VDC as String
        
    -Enabled [<SwitchParameter>]
        Should the New Org VDC be enabled after creation
        
        Default:$false
        
        Note: If an External Network is requested the Org VDC will be enabled during External Network Configuration
        
    -ProviderVDC <String>
        ProviderVDC where the new Org VDC should be created as string
        
    -Org <String>
        Org where the new Org VDC should be created as string
        
    -Timeout <Int32>
        Timeout for the Org VDC to get Ready
        
        Default: 120s
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>New-MyOrgVdc -Name "TestVdc" -CPULimit 1000 -MEMLimit 1000 -StorageLimit 1000 -StorageProfile "Standard-DC01" -NetworkPool "NetworkPool-DC01" -ProviderVDC 
    "Provider-VDC-DC01" -Org "TestOrg" -ExternalNetwork "External_OrgVdcNet"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>New-MyOrgVdc -Name "TestVdc" -CPULimit 1000 -MEMLimit 1000 -StorageLimit 1000 -StorageProfile "Standard-DC01" -NetworkPool "NetworkPool-DC01" -ProviderVDC 
    "Provider-VDC-DC01" -Org "TestOrg"
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help New-MyOrgVdc -examples".
    For more information, type: "get-help New-MyOrgVdc -detailed".
    For technical information, type: "get-help New-MyOrgVdc -full".
    For online help, type: "get-help New-MyOrgVdc -online"




