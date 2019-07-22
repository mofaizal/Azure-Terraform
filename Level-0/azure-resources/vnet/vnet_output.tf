
# Returns Output for Region
output "region" {
  description = "The location of the newly created Resource Groups"
  value       = "${azurerm_virtual_network.vnet.*.location}"
}

# Returns Output for Virtual Network Name
output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = "${azurerm_virtual_network.vnet.*.name}"
}

# Returns Output for Virtual Network id
output "vnet_id" {
  description = "The Name of the newly created vNet"
  value       = "${azurerm_virtual_network.vnet.*.id}"
}

# Returns Output for Virtual Network Address Space
output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = "${azurerm_virtual_network.vnet.*.address_space}"
}

#Returns the output of resourcce group name
output "resource_group_name" {
  value   ="${azurerm_virtual_network.vnet.*.resource_group_name}"
}
