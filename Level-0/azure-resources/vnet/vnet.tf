# Resource Creation for virtual network
resource "azurerm_virtual_network" "vnet" {
   count               = "${var.vnet_enable  == 1 ? length(var.vnet_name) : 0 }"
   name                = "${lower("vnet-${var.environment}-${var.vnet_name[count.index]}")}"
   address_space       = ["${var.vnet_address[count.index]}"]
   location            = "${var.region}"
   resource_group_name = "${var.resource_group_name}"
   tags                = "${var.tagvalue}"
}
