# Variable Declaration for Resource group name
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default = "networking"
}


# Variable Declaration for Region/Location
variable "region" {
  description = "The location/region where resources is created. Changing this forces a new resource to be created."
  default = ""
}


# Variable Declaration for Vnet enable/disable flag
variable "vnet_enable" {
  description = "The name of Vnet Enable"
  default = 0
}



# Variable Declaration for Vnet address space
variable "vnet_address" {
  description = "The address of the virtual network where the virtual machines will reside"
  type = "list"
  default = [""]
}


# Variable Declaration for Vnet Names
variable "vnet_name" {
  description = "The name of the virtual network where the virtual machines will reside."
  type = "list"
  default = [""]
}

# Variable Declaration for subnet count enable/disable flag
variable "subnet_count" {
  description = "The name Subnet Count"
  default = 0
}


# Variable Declaration for Subnet names
variable "subnet_names" {
  description = "The subnet name of the virtual network where the virtual machines will reside."
  type="list"
  default = [""]
}


# Variable Declaration for Subnet range
variable "subnet_range" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  type="list"
  default = [""]
}


# Variable Declaration forER subnet enable/disable flag
variable "er_subnet_enable" {
  description = "The name for ER Subnet Enable"
  default = 0
}


# Variable Declaration for Subnet ER range
variable "subnet_er_range" {
  description = "The name of the subnet ranges"
  type = "list"
  default  = [""]
}


# Variable Declaration for Subnet 
variable "subnet_er" { 
  description = "The name of the subnet ER"
  type = "list"
  default = [""]
}


# Variable Declaration for management subnet enable/disable flag
variable "management_subnet_enable" {
  description = "The name for the Management Subnet Enable"
  default = 0
}


# Variable Declaration for Subnet management
variable "subnet_management" {
  description = "The name of the Subnet Management"
  type = "list"
  default = [""]
}


# Variable Declaration for Subnet management range
variable "subnet_management_range" {
  description = "The name of the Subnet Management "
  type = "list"
  default = [""]
}


# Variable Declaration for NSG enable/disable flag
variable "nsg_enable" {
  description = "The name of NSG Enable"
  default = 0
}


# Variable Declaration for NSG Tier1 rules
variable "nsg_tier1_rules" {
  description = "The nsg rules for tier1."
  type= "list"
  default = [""]
}


# Variable Declaration for NSG Tier2 rules
variable "nsg_tier2_rules" {
  description = "The nsg rules for tier2."
  type= "list"
  default = [""]
}


# Variable Declaration for NSG Tier3 rules
variable "nsg_tier3_rules" {
  description = "The nsg rules for tier3."
  type= "list"
  default = [""]
}


# Variable Declaration for NSG names to be created
variable "nsg_names" {
    description = "The list of NSG names."
    type = "list"
    default = [""]
}


# Variable Declaration for RT enable/disable flag
variable "rt_enable" {
  description = "The name for the RT Enable"
  default = 0
}


# Variable Declaration for Route tables name to be created
variable "rt_names" {
  description = "The route table name list."
  type = "list"
  default = [""]
}


# Variable Declaration for Service Endpoint Enable
variable "service_endpoints_enable" {
  description = "The service Endpoint Enable"
  default = 0
}



#Variable Declaration for Tag Value
variable "tagvalue" {
    description = "The value for the tag"
    type="map"
}


#Variable Declaration for Environment Tag
variable "environment" {
    description = "The environment name to be provided"
    default = ""
}
