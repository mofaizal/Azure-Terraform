#Variable Declaration for Resource group Name
variable "resource_group_name" {
}

# Variable Declaration for region
variable "region" {
}

# Variable Declaration for Environment
variable "environment" {
}

# Variable Declaration for Virtual Network Peering
variable "vnet_peering_enable" {
 
}

# Variable Declaration for virtual network name
variable "vnet_name"  {
    type        = "list"
}

# Variable Declaration for allow_virtual_network_access
variable "allow_virtual_network_access" {
   default = "false" 
}

# Variable Declaration for allow_forwarded_traffic
variable "allow_forwarded_traffic" {
   default = "false"
}

#Variable Declaration for  allow_gateway_transit
variable "allow_gateway_transit" {
   default = "false"
}

# Variable Declaration for use_remote_gateways
variable "use_remote_gateways" {
    default = "false"
}

# Variable declaration for vnet id of Hub
variable "vnet_id" {
  
}

# Variable declaration for vnet id of Spoke
variable "vnet1_id" {
  
}

# Variable declaration for Bastion resource group
variable "peer2_resource_group" {
  
}


