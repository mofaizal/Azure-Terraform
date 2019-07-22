# Variable Declaration for Resource group name
variable "resource_group_name" {
}

# Variable Declaration for Region
variable "region" {
  }

# Variable Declaration for Virtual Network Enable
variable "vnet_enable" {
  
}

# Variable Declaration for Virtual Network Name
variable "vnet_name" {
   type = "list"
}

# Variable Declaration for Virtual Network Address
variable "vnet_address" {
    type = "list"
}



# Variable Declaration for Tag Value
variable "tagvalue" {
  type = "map"
}

# Variable Declaration for Environment
variable "environment" {
}
