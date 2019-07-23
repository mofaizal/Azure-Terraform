
# Azure Terraform Three Tier architecture deployment pattern

This repository contains the terraform script. This script is set of deployment artifacts using terraform scripts which form a 3-tier architecture template to make it simple an orchestration engine (infrastructure as code). It allows you to deploy an example 3 tier architecture infrastructure environment (Level 0) and workload environments capable of hosting VM (Level 1). 
Pattern – Three Tier architecture deployment using terraform

## Three Tier architecture deployment given below diagram provide detail representation of the terraform script outcome

#### Architecture 
![alt text](https://github.com/mofaizal/Azure-Terraform/blob/master/images/image002.png) 

### Step 1: Build and Deploy baseline state with network component 
 
#### Terraform script folder structure 
Below snapshot provide folder structure of terraform scripts.  
- Common-modules 
  * Resource Group
-	Level 0 
  * Azure resources
- Abstract resource layer
* VNET
* Subnet 
* NSG
* NSG association
* Route Table 
* Route table association
* VNET peering 
* Main Module (abstract layer)

### Steps to run terraform script 
#### Level 0 Pre-Requisites
1.	Ensure Level 0 terraform.tfvars is configured properly. 
2.	User who logs in to run Level 0 script should have “Owner” rights
3.	Login in interactive mode using az login 
4.	set the subscription using command  
```
az account set –subscription “subscription_name”
```
#### Level 0 Execution Steps
1.	Execute terraform script using below commands
* Terraform Init
*  Terraform Plan
* Terraform Apply

#### Terraform TFVAR input required

Update TFVAR file at Level 0 folder as per your requirements, You don’t required update any other terraform modules input parameters. Script will fetch from TFVAR and Terraform output state.  

```
# Name for the environment
environment                              = "dev"

# Parameter for Creating Azure Resources
region                                   = "Southeast Asia"
resource_group_name                      = "networking"
# Parameter for Create Virtual network and Subnets
vnet_name                                = ["project1","project2"]
vnet_address                             = ["10.100.0.0/16","10.200.0.0/16"]
subnet_names                             = ["Web","App","DB"]
subnet_er                                = ["GatewaySubnet"]
subnet_management                        = ["management"]
subnet_er_range                          = ["10.100.3.0/24"]
subnet_management_range                  = ["10.100.4.0/24"]
subnet_range                             = ["10.100.0.0/24","10.100.1.0/24","10.100.2.0/24"]

# Parameter for Create Network Security Groups
nsg_names                                = ["Web","App","DB"]
nsg_tier1_rules                          = ["Allow_Port80_Inbound","Allow_Port443_Inbound","Allow_Port3389_Inbound","Deny_Virtualnetwork_Inbound"]
nsg_tier2_rules                          = ["Deny_Virtualnetwork_Inbound","Allow_Azuremonitor_Outbound","Deny_Internet_Outbound"]
nsg_tier3_rules                          = ["Deny_Virtualnetwork_Inbound","Allow_Azuremonitor_Outbound","Deny_Internet_Outbound"]

# Parameter for Create Route Table
rt_names                                 = ["Web","App","DB","gatewaysubnet","management"]

# Parameter for Azure Resources Tags
tagvalue                           =  {

      environment                  = "Development"
}  

```

#### Resource Naming standard 

The resource naming standard automated, the pattern for forming the name given below 
-	First two or three letter of resource item name = rg 
-	Environment = DEV
-	Resource Name = Resource Group Name
Example Rg-dev-project1

```
  name             = "${lower("rg-${var.environment}-${var.resource_group_name}")}"
```


### Step 2: Deploy VM and project related items. 
#### Level 1 

* Architecture ![alt text](https://github.com/mofaizal/Azure-Terraform/blob/master/images/image004.png) 
 

#### Terraform script folder structure for step 2

#### Below snapshot provide folder structure of terraform scripts.  

-	Application Layer
-	NIC
-	Public IP
-	Virtual Machine

#### Level 1 Pre-Requisites
1.	Ensure Level 1 terraform.tfvars is configured properly. 
2.	Ensure All components of Level 0 are created
3.	User who logs in to run Level 1 script should have “Owner” rights
4.	Login in interactive mode using az login 
5.	set the subscription using command az account set –subscription “subscription_name”

#### Level 1 Execution Steps
1.	Execute terraform script using below commands
* Terraform Init
*  Terraform Plan
* Terraform Apply

#### Terraform TFVAR input required

Update TFVAR file at Level 1 folder as per your requirements, You don’t required update any other terraform modules input parameters. Script will fetch from TFVAR and Terraform output state. 

```

# Parameter for Creating Azure Resources
resource_group_name                         = "networking"
region                                      = "Southeast Asia"



# Parameter for Create Virtual network and Subnets
vnet_name                                   = "project1"
subnet_names                                = ["web","app","DB"]

# Parameter for Azure Resources Tags
tagvalue                                    =  {

      environment                  = "Development"
      project                      = "test_project"
}  
environment                                 = "dev"

# Parameter for the Public IP Creation VM
public_ip_allocation_method                 = "Static"
vm_public_ip_name                           = "vm-project1"

# Parameter for Network Interface
nic_name                                    = "web"
nic_ip_config_name                          = "nic_i_config"
nic_ip_allocation_method                    = "Dynamic"
nic_type                                    = "Public"

#parameters for virtual machine
vm_name                                     = "project1"
vm_size                                     = "Standard_B1s"
image_publisher                             = "MicrosoftWindowsServer"
image_offer                                 = "WindowsServer"
image_version                               = "latest"
image_sku                                   = "2016-Datacenter"
vm_os_disk_name                             = "disk1"
os_caching                                  = "ReadWrite"
create_option                               = "FromImage"
managed_disk_type                           = "Standard_LRS"
computer_name                               = "hostname"
admin_username                              = "vm-admin"
admin_password                              = "Welcome1234!"
```

## Terraform modules 
#### Resource Group Module 
A resource group is a logical construct that groups multiple resources together so they can be managed as a single entity which allow you assign RBAC and allow you to calculate resource cost.

|    Name      |    Type   / Component    |    Description                            |
|--------------|--------------------------|-------------------------------------------|
|    Module    |    resource-group        |    Creates   a resource group on Azure    |

#### Input 

|    Name                   |    Type       |    Default Value    |    Example                                                                                                |    Description                                   |
|---------------------------|---------------|---------------------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------------|
|    rg_enable              |    Integer    |    1                |    1                                                                                                      |    Enabling   or Disabling the Resource group    |
|    resource_group_name    |    String     |    Empty            |    Networking                                                                                             |    Name of the Resource group                    |
|    Region                 |    String     |    Empty            |    Southeast   Asia                                                                                       |    Location   of the Resource group              |
|    Tagvalue               |    Map        |    Empty            |    tagvalue                                =    {        client_segment                       = ""   }    |    List of tag values to be attached             |
|    Environment            |    String     |    Empty            |    Dev                                                                                                    |    Environment                                   |

#### Output

|    Name                   |    Type      |    Description                      |
|---------------------------|--------------|-------------------------------------|
|    resource_group_name    |    String    |    Names   of the Resource group    |

#### VNET Module 
VNET module creates a Virtual Network in a subscription. User with Owner or contributor rights would be required to create a VNET. VNet enables many types of Azure resources, such as Azure Virtual Machines (VM), to securely communicate with each other, the internet, and on-premises networks.

|    Name           |    Component    |    Description                                                                   |
|-------------------|-----------------|----------------------------------------------------------------------------------|
|    Module         |    VNET         |    Creates   the Virtual Network                                                 |
|    Module Type    |    Common       |    Common module reused in across many terraform project or abstract   layers    |


### Input 

|    Name                   |    Type       |    Default Value    |    Example                                                                                                |    Description                                                      |
|---------------------------|---------------|---------------------|-----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
|    resource_group_name    |    String     |    Empty            |    rg-dev-networking                                                                                      |    Name   of the resource group where VNET resource gets created    |
|    Region                 |    String     |    Empty            |    Southeast Asia                                                                                         |    Location on which vnet to be created                             |
|    vnet_enable            |    Integer    |    1                |    1                                                                                                      |    Create   or Not to Create Vnet based on this value               |
|    vnet_name              |    List       |    Empty            |    [“project1”]                                                                                           |    Virtual network name                                             |
|    vnet_address           |    List       |    Empty            |    ["10.100.0.0/16"]                                                                                      |    CIDR   Rage of Virtual network                                   |
|    TagValue               |    Map        |    Empty            |    tagvalue                                =    {        client_segment                       = ""   }    |    List of tag values to be attached                                |
|    Environment            |    String     |    Empty            |    dev                                                                                                    |    Environment   name                                               |

#### Output

|    Name                   |    Type    |    Description                                  |
|---------------------------|------------|-------------------------------------------------|
|    Region                 |    List    |    Region   of the Virtual network              |
|    Vnet_name              |    List    |    Name of Virtual network                      |
|    vnet_address_space     |    List    |    Address   space of the newly created Vnet    |
|    resource_group_name    |    List    |    Name of the Resource group for Vnet          |
|    vnet_id                |    List    |    ID   allocated for the Vnet                  |


#### Subnet Module
Subnet module creates a Subnet in a subscription. User with Owner rights or Contributor rights would be required to create a subnet. Subnets enable to segment the virtual network into one or more sub-networks and allocate a portion of the virtual network's address space to each subnet

|    Name      |    Type   / Component    |    Description                                   |
|--------------|--------------------------|--------------------------------------------------|
|    Module    |    subnet                |    Creates   Subnet inside the specified vnet    |

#### Input 

|    Name                       |    Type       |    Default Value    |    Example                                  |    Description                                                        |
|-------------------------------|---------------|---------------------|---------------------------------------------|-----------------------------------------------------------------------|
|    Subnet_count               |    Numeric    |    Empty            |    1                                        |    Number   of subnet to be created                                   |
|    Vnet_name                  |    String     |    Empty            |    vnet-dev-project1                        |    Virtual network name                                               |
|    Subnet_names               |    List       |    Empty            |    [“Web”,”App”,”DB”]                       |    Name   of the subnet                                               |
|    Subnet_range               |    List       |    Empty            |    ["10.110.0.0/24",”10.120.0.0/24”]        |    CIDR Rage of subnet                                                |
|    resource_group_name        |    String     |    Empty            |    rg-dev-networking                        |    Name   of the resource group where subnet resource gets created    |
|    Service_endpoint_enable    |    Integer    |    1                |    1                                        |    Create or Not to Create service endpoint  based on this value      |
|    Service_endpoints          |    Array      |    Empty            |    [“Microsoft.sql”]                        |    Service   endpoints to be enabled                                  |
|    Service                    |    List       |    ["0","0","1"]    |    [1“0”,”0”,”1”]                           |    Name of the services                                               |
|    Environment                |    String     |    Empty            |    dev                                      |    Name   of the environment                                          |

### Output

|    Name            |    Type    |    Description          |
|--------------------|------------|-------------------------|
|    Vnet_subnets    |    List    |    Name   of subnets    |
|    Subnet_id       |    List    |    Id of subnets        |
		

### NSG Module 
A network security groups contains list of security rules to allow or deny network traffic to resources connected to the virtual networks.

|    Name      |    Type   / Component    |    Description                                                                          |
|--------------|--------------------------|-----------------------------------------------------------------------------------------|
|    Module    |    Nsg                   |    Creates   a network security group that contains a list of network security rules    |
|              |                          |                                                                                         |

### Input 
|    Name                   |    Type       |    Default Value    |    Example                                                                                            |    Description                                              |
|---------------------------|---------------|---------------------|-------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
|    nsg_enable             |    Integer    |    Empty            |     1                                                                                                 |    Enabling   or Disabling the NSG Flag                     |
|    resource_group_name    |    String     |    Empty            |    rg-dev-networking                                                                                  |    Name of the Resource group where NSG is to be created    |
|    Region                 |    String     |    Empty            |    Southeast   Asia                                                                                   |    Name   of the Region where the NSG is to be created      |
|    nsg_name               |    List       |    Empty            |    [Web, App, DB]                                                                                     |    Names for the NSGs                                       |
|    tagValue               |    Map        |    Empty            |    tagvalue                              =    {        client_segment                     = ""   }    |    List   of tag values to be attached                      |
|    environment            |    String     |    Empty            |    dev                                                                                                |    Environment name                                         |
### Output

|    Name         |    Type    |    Description                 |
|-----------------|------------|--------------------------------|
|    nsg_id       |    List    |    ID   of NSGs created        |
|    nsg_names    |    List    |    Name of the NSGs created    |

### NSG Rules Module
A network security group contains network security rules to enforce the network policies.

|    Name      |    Type   / Component    |    Description                             |
|--------------|--------------------------|--------------------------------------------|
|    Module    |    nsg-rules             |    Creates   the network security rules    |

### Input 

Name	Type	Default Value	Example	Description
resource_group_name	String	Empty	rg-dev-networking	Name of the Resource group where NSG is to be created
nsg_name	List	Empty	[nsg-dev-web,nsg-dev-app]	Names for the NSGs
nsg_rules	List	Empty	[Allow_Internet_Inbound,Deny_Virtual_Network_Outbound]	Rules for Network security group

### NSG Association Module 

Nsg-association module is used to associate the network security group with the respective subnet 

|    Name      |    Type   / Component    |    Description                                                            |
|--------------|--------------------------|---------------------------------------------------------------------------|
|    Module    |    Nsg-association       |    Associates   the Network Security Group with a subnet within a Vnet    |

### Input 
|    Name            |    Type       |    Default Value    |    Example    |    Description                        |
|--------------------|---------------|---------------------|---------------|---------------------------------------|
|    subnet_id       |    List       |    Empty            |               |    ID   allocated for the Subnet      |
|    nsg_id          |    List       |    Empty            |               |    ID allocated for the NSG           |
|    nsg_enable      |    Integer    |    Empty            |    1          |    Enabling   or Disabling the NSG    |
|    subnet_count    |    Integer    |    Empty            |    3          |    Count of the Subnet                |

### Route Table Module 
A route table contains a set of rules, called routes, that specifies how packets should be routed in a virtual network

|    Name      |    Type   / Component    |    Description                |
|--------------|--------------------------|-------------------------------|
|    Module    |    routetable            |    Creates   a Route Table    |

### Input 

|    Name                   |    Type       |    Default Value    |    Example                                                                                                |    Description                                         |
|---------------------------|---------------|---------------------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
|    rt_enable              |    Integer    |    Empty            |    1                                                                                                      |    Enabling   or Disabling the Route Table             |
|    subnet_count           |    Integer    |    Empty            |    3                                                                                                      |    Subnet count to be used for creating Route table    |
|    rt_name                |    List       |    Empty            |    [“Web”,”App”,”DB”]                                                                                     |    Name   of the Route Table                           |
|    resource_group_name    |    String     |    Empty            |    rg-dev-networking                                                                                      |    Name of the Resource group of the Route table       |
|    Region                 |    String     |    Empty            |    Southeast   Asia                                                                                       |    Location   of the Resource group                    |
|    Tagvalue               |    Map        |    Empty            |    tagvalue                                =    {        client_segment                       = ""   }    |    List of tag values to be attached                   |
|    environment            |    String     |    Empty            |    Dev                                                                                                    |    Environment   Name                                  |


### Route Table association Module
Route-table-association module associates the route table with the specified subnet

|    Name      |    Type   / Component        |    Description                                              |
|--------------|------------------------------|-------------------------------------------------------------|
|    Module    |    Routetable-association    |    Associating   route table with a subnet within a Vnet    |

### Input 

|    Name            	|    Type       	|    Default Value    	|    Example    	|    Description                                	|
|--------------------	|---------------	|---------------------	|---------------	|-----------------------------------------------	|
|    rt_id           	|    List       	|    Empty            	|               	|    ID   allocated for the Route table         	|
|    subnet_id       	|    List       	|    Empty            	|               	|    ID allocated for the subnet                	|
|    rt_enable       	|    Integer    	|    Empty            	|    1          	|    Enabling   or Disabling the Route table    	|
|    subnet_count    	|    Integer    	|    Empty            	|    2          	|    Count of the Subnets                       	|

### VNET Peering Module 
VNet peering is a mechanism that connects two virtual networks (VNets) in the same region through the Azure backbone network. Once peered, the two virtual networks appear as one for all connectivity purposes

|    Name      |    Type   / Component    |    Description                                                                                       |
|--------------|--------------------------|------------------------------------------------------------------------------------------------------|
|    Module    |    Vnet-peering          |    Creates   a Vnet peering which allows resources to access other resources in the linked   Vnet    |


### Input 

|    Name                            	|    Type       	|    Default Value    	|    Example                                         	|    Description                                       	|
|------------------------------------	|---------------	|---------------------	|----------------------------------------------------	|------------------------------------------------------	|
|    resource_group_name             	|    String     	|    Empty            	|    rg-dev-networking                               	|    Name   of the Resource group for vnet             	|
|    Region                          	|    String     	|    Empty            	|    Southeast Asia                                  	|    Region                                            	|
|    environment                     	|    String     	|    Empty            	|    dev                                             	|    Environment   name                                	|
|    vnet_peering_enable             	|    Integer    	|    Empty            	|    1                                               	|    Enabling or Disabling the Vnet peering            	|
|    vnet_name                       	|    List       	|    Empty            	|    [“vnet-dev-project1”,”vnet-dev-   project2”]    	|    Name   of the Vnets                               	|
|    allow_virtual_network_access    	|    String     	|    False            	|    False                                           	|    Allow or Disallow the access for the Vnet         	|
|    allow_forwarded_traffic         	|    String     	|    False            	|    false                                           	|    Allow   or Disallow the forwarded traffic         	|
|    allow_gateway_transit           	|    String     	|    False            	|    false                                           	|    Allow or Disallow the gateway transit             	|
|    use_remote_gateways             	|    String     	|    False            	|    false                                           	|    Allow   or Disallow the use of remote gateways    	|
|    vnet_id                         	|    String     	|    Empty            	|                                                    	|    Id of the Vnet                                    	|
|    vnet1_id                        	|    String     	|    Empty            	|                                                    	|    Id   of the Vnet-1                                	|
|    bastion_resource_group          	|    String     	|    Empty            	|    rg-dev-networking                               	|    Resource group of the bastion                     	|
|    tenant_id                       	|    String     	|    Empty            	|    xxxx-xxxx-xxx-xxx                               	|    ID   of the Tenant                                	|
|    subscription_id                 	|    String     	|    Empty            	|    Xxxx-xxxx-xxxx-xxx                              	|    ID of the Subscription                            	|
|    env_subscription_id             	|    String     	|    Empty            	|    Xxxx-xxx-xxx-xxx                                	|    ID   of the Subscription in the environment       	|


# Azure-Terraform
Azure Terraform Architecture Deployment Pattern
