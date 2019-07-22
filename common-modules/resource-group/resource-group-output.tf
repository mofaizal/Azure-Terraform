# Returns output of the Resource Group name 
output "resource_group_name" {
    value = "${azurerm_resource_group.resource_group.0.name}"
}
