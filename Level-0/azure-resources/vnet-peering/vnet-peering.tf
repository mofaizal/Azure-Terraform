

#Resource Creation for Peer 1 Connection 
resource "azurerm_virtual_network_peering" "Peer1" {
  count                        =  "${var.vnet_peering_enable == 1 ? 1 : 0}"
  name                         = "${lower("vnet-${var.environment}-${var.vnet_name[0]}-to-vnet-${var.environment}-${var.vnet_name[1]}")}"
  resource_group_name          = "${var.resource_group_name}"
  virtual_network_name         = "vnet-${var.environment}-${var.vnet_name[0]}"
  remote_virtual_network_id    = "${var.vnet_id}"
  allow_virtual_network_access = "${var.allow_virtual_network_access}"
  allow_forwarded_traffic      = "${var.allow_forwarded_traffic}"
  allow_gateway_transit        = "${var.allow_gateway_transit}"

}

#Resource Creation for Peer 1 Connection 
resource "azurerm_virtual_network_peering" "Peer2" {
  count                        =  "${var.vnet_peering_enable  == 1 ? 1 : 0}"
  name                         = "${lower("vnet-${var.environment}-${var.vnet_name[1]}-to-vnet-${var.environment}-${var.vnet_name[0]}")}"
  resource_group_name          = "${var.peer2_resource_group}"
  virtual_network_name         = "vnet-${var.environment}-${var.vnet_name[1]}"
  remote_virtual_network_id    = "${var.vnet1_id}"
  allow_virtual_network_access = "${var.allow_virtual_network_access}"
  allow_forwarded_traffic      = "${var.allow_forwarded_traffic}"
  allow_gateway_transit        = "${var.allow_gateway_transit}"
  use_remote_gateways          = "${var.use_remote_gateways}"
  depends_on                   = ["azurerm_virtual_network_peering.Peer1"]
 

}

