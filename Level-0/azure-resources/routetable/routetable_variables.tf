# Variable declaration for the route table enable/disable flag
variable "rt_enable" {
  
}


# Variable declaration for the subnet count to be used for creating RTs
variable "subnet_count" {

}


# Variable declaration for the route table name to be created
variable "rt_name" {
  type = "list" 
}


# Variable declaration for the resource group name of RT 
variable "resource_group_name" {

}


# Variable declaration for region of RT
variable "region" {
}


# Variable declaration for Tags to be added
variable "tagvalue" {
    type = "map"
}


# Variable declaration for the Environment value to be added
variable "environment" {
  
}