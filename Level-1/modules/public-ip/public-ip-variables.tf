# Variable Declaration for Public ip enable
variable "public_ip_enable" {
  default = 1
}


# Variable declaration for Resource group name in which IP gets created
variable "resource_group_name" {

}


# Variable declaration for Region in which IP gets created
variable "region" {

}

# Variable declaration for allocation method of the IP
variable "allocation" {
  default = "Static"
}


# Variable Declaration for public IP Name
variable "public_ip_names" {
  type = "list"
}

# Variable declaration for ip sku
variable "sku_type" {
  default = "Basic"
}

# Variable Declaration for  Variable Declaration for Tag Value
variable "tagvalue" {
  type = "map"
}
# Variable Declaration for Environment value to be added
variable "environment" {

}