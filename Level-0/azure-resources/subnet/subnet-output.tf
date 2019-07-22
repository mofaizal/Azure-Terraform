# Returns the output of the subnet
output "vnet_subnets" {
  value  = "${azurerm_subnet.subnet.*.name}"
}


# Returns the output of the Subnet IDs
output "subnet_id" {
  value = "${azurerm_subnet.subnet.*.id}"
}