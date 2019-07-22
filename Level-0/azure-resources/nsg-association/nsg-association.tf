# Resource Creation to associate nsg with subnet
resource "azurerm_subnet_network_security_group_association" "networksgassociation" {
    count                     = "${var.nsg_enable == 1 ? var.subnet_count : 0}"
    subnet_id                 = "${var.subnet_id[count.index]}"
    network_security_group_id = "${var.nsg_id[count.index]}" 
   }