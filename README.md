VMware-vCD-Module PowerShell Module
===================================
[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=vMarkus_K&url=https://github.com/mycloudrevolution/VMware-vCD-Module&title=VMware-vCD-Module&language=Powershell&tags=github&category=software)

![Invoke-MyOnBoarding](/media/Invoke-MyOnBoarding.png)

# About

## Project Owner:

Markus Kraus [@vMarkus_K](https://twitter.com/vMarkus_K)

MY CLOUD-(R)EVOLUTION [mycloudrevolution.com](http://mycloudrevolution.com/)


## Project WebSite:
[PowerCLI vCloud Director Customer Provisioning](https://mycloudrevolution.com/2017/06/13/powercli-vcloud-director-customer-provisioning/)

[PowerCLI – Create vCloud Director Edge Gateway](https://mycloudrevolution.com/2017/06/27/powercli-create-vcloud-director-edge-gateway/)


## Project Documentation:

[Read the Docs - VMware-vCD-Module](http://vmware-vcd-module.readthedocs.io/)

## Project Description:

The 'VMware-vCD-Module' PowerShell Module is focused on the initial creation of VMware vCloud Director Objects like Org, Org User, Org VDC with External Networks or Edge Gateway.

All Functions in this Module can be used as standalone Cmdlet but also the ``Invoke-My OnBoarding`` Functions to process a JSON File and create all Objects at once.

### Fully tested Versions:

Powershell: v4, v5, v5.1

PowerCLI: 6.5.1, 6.5.4

VMware vCloud Director: 8.20.1, 9.1

### Individual functions of the Module

#### New-MyOrg
 ```PowerShell
New-MyOrg -Name "TestOrg" -FullName "Test Org" -Description "PowerCLI Test Org"
```

#### New-MyOrgAdmin
 ```PowerShell
New-MyOrgAdmin -Name "OrgAdmin" -Pasword "Anfang!!" -FullName "Org Admin" -EmailAddress "OrgAdmin@TestOrg.local" -PhoneNumber "0049123456789" -Org "TestOrg" -Enabled:$True
```

#### New-MyOrgVdc
 ```PowerShell
New-MyOrgVdc -Name "TestVdc" -AllocationModel AllocationVApp -StorageLimit 1000 -StorageProfile "Standard-DC01" -NetworkPool "NetworkPool-DC01" -ProviderVDC "Provider-VDC-DC01" -Org "TestOrg"

```

#### New-MyEdgeGateway
 ```PowerShell
New-MyEdgeGateway -Name "TestEdge" -OrgVDCName "TestVDC" -OrgName "TestOrg" -Size "full" -ExternalNetwork "ExternalNetwork" -IPAddress "192.168.100.1" -SubnetMask "255.255.255.0" -Gateway "192.168.100.254" -IPRangeStart "192.168.100.2" -IPRangeEnd "192.168.100.3" -Verbose
```

#### New-MyOrgNetwork
 ```PowerShell
New-MyOrgNetwork -Name Test -OrgVdcName "Test-OrgVDC" -OrgName "Test-Org" -EdgeName "Test-OrgEdge" -SubnetMask 255.255.255.0 -Gateway 192.168.66.1 -IPRangeStart 192.168.66.100 -IPRangeEnd 192.168.66.200 -Shared:$false
```
![New-MyOrgNetwork](/media/New-MyOrgNetwork.png)

#### New-MyExternalNetwork
 ```PowerShell
$params = @{ 'name' = 'MyTest';
             'vCenterName'='MyVcenter';
             'PortGroupName'='MyTest';
             'SubnetMask' = '255.255.255.0';
             'Gateway' = '192.168.110.1';
             'IPRangeStart' = '192.168.110.100';
             'IPRangeEnd' = '192.168.110.200'
             }
New-MyExternalNetwork @params
```
![New-MyExternalNetwork](/media/New-MyExternalNetwork.png)


