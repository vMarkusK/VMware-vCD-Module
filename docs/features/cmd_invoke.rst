Invoke Commands
=========================

This page contains details on **Invoke** commands.

Invoke-MyOnBoarding
-------------------------


NAME
    Invoke-MyOnBoarding
    
SYNOPSIS
    Creates all vCD Objecst for a new IAAS Customer
    
    
SYNTAX
    Invoke-MyOnBoarding [-ConfigFile] <String> [-Enabled] [<CommonParameters>]
    
    
DESCRIPTION
    Creates all vCD Objects for a new IAAS Customer
    
    All Objects are:
    * Org
    * Default Org Admin
    * Org VDC
    ** Private Catalog
    ** Optional Bridged Network
    
    JSON Config Example:
    
    {
    "Org": {
            "Name":"TestOrg",
            "FullName": "Test Org",
            "Description":"Automation Test Org"
        },
    "OrgAdmin": {
            "Name":"TestOrgAdmin",
            "Pasword": "myPassword1!",
            "FullName":"Test OrgAdmin",
            "EmailAddress":"test@admin.org"
        },
    "OrgVdc": {
            "Name":"TestOrgVdc",
            "FixedSize": "M",
            "CPULimit": "1000",
            "MEMLimit":"1000",
            "StorageLimit":"1000",
            "StorageProfile":"Standard-DC01",
            "ProviderVDC":"Provider-VDC-DC01",
            "NetworkPool":"Provider-VDC-DC01-NetPool",
            "ExternalNetwork": "External_OrgVdcNet"
        }
    }
    

PARAMETERS
    -ConfigFile <String>
        Full Path to the JSON Config File
        
    -Enabled [<SwitchParameter>]
        Should the Customer be enabled after creation
        
        Default: $False
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Invoke-MyOnBoarding -ConfigFile ".\OnBoarding.json" -Enabled:$true
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Invoke-MyOnBoarding -ConfigFile ".\OnBoarding.json" -Enabled:$false
    
    
    
    
    
    
REMARKS
    To see the examples, type: "get-help Invoke-MyOnBoarding -examples".
    For more information, type: "get-help Invoke-MyOnBoarding -detailed".
    For technical information, type: "get-help Invoke-MyOnBoarding -full".
    For online help, type: "get-help Invoke-MyOnBoarding -online"




