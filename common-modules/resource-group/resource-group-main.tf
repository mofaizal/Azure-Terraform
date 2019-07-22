# Source code for the Resource Group Creation
resource "azurerm_resource_group" "resource_group" {
  count            = "${var.rg_enable == 1 ? 1 : 0}"
  name             = "${lower("rg-${var.environment}-${var.resource_group_name}")}"
  location         = "${var.region}"
  tags             = "${var.tagvalue}"
}

