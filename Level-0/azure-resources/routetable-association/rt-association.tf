# Resource creation to associate rt with subnets
resource "azurerm_subnet_route_table_association" "rt_subnet_association" {
  count          = "${var.rt_enable == 1 ? var.subnet_count : 0}"
  subnet_id      = "${var.subnet_id[count.index]}"
  route_table_id = "${var.rt_id[count.index]}"
}