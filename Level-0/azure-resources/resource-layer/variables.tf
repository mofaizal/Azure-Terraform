
# Variable decalration for VNET peering enable
variable "vnet_peering_enable" {
  default = 1
}

# Variable Declaration for Vnet Names
variable "vnet_name" {
  description = "The name of the virtual network where the virtual machines will reside."
  type = "list"
  default = [""]
}

# Variable Declaration for Resource group name
variable "resource_group_name" {
  description = "The name of the resource group in which the \\ will be created"
  default =  "RG_"
}


# Variable Declaration for Location
variable "region" {
  description = "The location/region where \\ is created. Changing this forces a new resource to be created."
  default = "UK South"
}

# Variable Declaration for Vnet Address
variable "vnet_address" {
  description = "The address of the virtual network where the virtual machines will reside."
  type = "list"
  default = ["10.30.0.0/16"]
}


# Variable Declaration for list of subnet names
variable "subnet_names" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type="list"
  default = ["Subnet_CE_Tier1","Subnet_CE_Tier2","Subnet_CE_Tier3","Subnet_CE_ER" ,"Subnet_CE_Management"]
}


# Variable Declaration for list of subnet range
variable "subnet_range" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  type="list"
  default = ["10.30.0.0/24","10.30.1.0/24","10.30.2.0/24","10.30.3.0/24","10.30.4.0/24"]
}


# Variable Declaration for NSG rules for tier1
variable "nsg_tier1_rules" {
  description = "The nsg rules for tier1."
  type= "list"
  default = ["Allow_Port80_Inbound","Allow_Port443_Inbound","Deny_Virtualnetwork_Inbound"]
}


# Variable Declaration for NSG rules for tier2
variable "nsg_tier2_rules" {
  description = "The nsg rules for tier2."
  type= "list"
  default = ["Deny_Virtualnetwork_Inbound","Allow_Azuremonitor_Outbound","Deny_Internet_Outbound"]
}


# Variable Declaration for NSG rules for tier3
variable "nsg_tier3_rules" {
  description = "The nsg rules for tier3."
  type= "list"
  default = ["Deny_Virtualnetwork_Inbound","Allow_Azuremonitor_Outbound","Deny_Internet_Outbound"]
}


# Variable Declaration for list of nsg names
variable "nsg_name" {
    description = "The list of NSG names."
    type = "list"
    default = ["NSG_CE_Tier1","NSG_CE_Tier2","NSG_CE_Tier3"]
}


# Variable Declaration for list of route table names

variable "rt_name" {
  description = "The route table name list."
  type = "list"
  default = ["RT_CE_Tier1", "RT_CE_Tier2","RT_CE_Tier3","RT_CE_ER", "RT_CE_Management"]
}



# Variable Declaration for ER Subnet 
variable "subnet_er" { 
    type = "list"
}


# Variable Declaration for  Management Subnet
variable "subnet_management" {
  type = "list"
}


# Variable Declaration for ER Subnet Range
variable "subnet_er_range" {
  type = "list"
}


# Variable Declaration for  Management Subnet Range
variable "subnet_management_range" {
  type = "list"
}


# Variable Declaration for RG Enable
variable "rg_enable" {
  default = 1
}


# Variable Declaration for Vnet Enable
variable "vnet_enable" {
  default = 0
}


# Variable Declaration for Subnet count
variable "subnet_count" {
  default = 0
}


# Variable Declaration for NSG Enable
variable "nsg_enable" {
  default = 0
}


# Variable Declaration for RT Enable
variable "rt_enable" {
  default = 0
}


# Variable Declaration for Management Subnet Enable
variable "management_subnet_enable" {
  default = 0
}


# Variable Declaration for ER Subnet Enable
variable "er_subnet_enable" {
  default = 0
}


# Variable Declaration for  Tag Value
variable "tagvalue" {
    description = "The value for the tag"
    type = "map"
}


# Variable Declaration for Environment
variable "environment" {
    description = "The environment name to be provided"
  
}


# Variable Declaration for Service Endpoint Enable
variable "service_endpoints_enable" {
  default = 0
}


# Variable Declaration for Service Endpoint
variable "service_endpoints" {
  type ="list"
  default = [""]
}
