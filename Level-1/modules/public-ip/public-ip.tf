# Source code for the Public IP creation
resource "azurerm_public_ip" "public_ip" {
  count                        = "${var.public_ip_enable == 1 ? length(var.public_ip_names) : 0}"
  name                         = "${lower("public-ip-${var.environment}-${var.public_ip_names[count.index]}")}"
  location                     = "${var.region}"
  resource_group_name          = "${var.resource_group_name}"
  allocation_method            = "${var.allocation}"
  tags                         = "${var.tagvalue}"
  sku                          = "${var.sku_type}"

}
