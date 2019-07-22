#To get subnet id 
data "azurerm_subnet" "subnet_id" {
    name                       = "${var.subnet_names}"
    virtual_network_name       = "${var.vnet_name}"
    resource_group_name        = "${var.resource_group_name}"
}

#Resource Creation of NIC for Tier 2 & 3
resource "azurerm_network_interface" "nic" {
  count                             = "${var.nic_enable == 1 ? 1 : 0}"
  name                              = "${lower("nic-${var.environment}-${var.nic_name}")}"
  location                          = "${var.region}"
  resource_group_name               = "${var.resource_group_name}"
  ip_configuration {
      name                          = "${var.ip_config_name}"
      subnet_id                     = "${data.azurerm_subnet.subnet_id.id}"
      public_ip_address_id          = "${var.nic_type == "Public" ? var.nic_public_ip_address_id : ""}"
      private_ip_address_allocation = "${var.ip_allocation_method}"
     }
  tags                              = "${var.tagvalue}"
  }

