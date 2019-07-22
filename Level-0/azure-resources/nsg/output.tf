# Returns the output of IDs of the NSGs created
output "nsg_id" {
    value = "${azurerm_network_security_group.networksg.*.id}"
}

# Returns the output of names fo the NSGs created
output "nsg_names" {
    value = "${azurerm_network_security_group.networksg.*.name}"
}