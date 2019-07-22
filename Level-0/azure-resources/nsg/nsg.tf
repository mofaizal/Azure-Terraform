# Source code for Creating network security group
resource "azurerm_network_security_group" "networksg" {
  count                       =  "${var.nsg_enable  == 1 ? var.subnet_count : 0}"
  name                        =  "${lower("nsg-${var.environment}-${var.nsg_name[count.index]}")}"
  location                    = "${var.region}"
  resource_group_name         = "${var.resource_group_name}"
  tags                        = "${var.tagvalue}"
}


# Source code for creating configured nsg rules for web layer
resource "azurerm_network_security_rule" "predefined_rules_web" {
  count                       = "${var.nsg_enable  == 1 && var.subnet_count >= 1 ? length(var.nsg_tier1_rules) : 0}"
  name                        = "${var.nsg_tier1_rules[count.index]}"
  priority                    = "${element(var.rules[var.nsg_tier1_rules[count.index]], 0)}"
  direction                   = "${element(var.rules[var.nsg_tier1_rules[count.index]], 1)}"
  access                      = "${element(var.rules[var.nsg_tier1_rules[count.index]], 2)}"
  protocol                    = "${element(var.rules[var.nsg_tier1_rules[count.index]], 3)}"
  source_port_range           = "${element(var.rules[var.nsg_tier1_rules[count.index]], 4)}"
  destination_port_range      = "${element(var.rules[var.nsg_tier1_rules[count.index]], 5)}"
  description                 = "${element(var.rules[var.nsg_tier1_rules[count.index]], 6)}"
  source_address_prefix       = "${element(var.rules[var.nsg_tier1_rules[count.index]], 7)}"
  destination_address_prefix  = "${element(var.rules[var.nsg_tier1_rules[count.index]], 8)}" 
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${lower("nsg-${var.environment}-${var.nsg_name[0]}")}"
  depends_on                  = ["azurerm_network_security_group.networksg"]
}


# Source code for creating configured nsg rules for app layer
resource "azurerm_network_security_rule" "predefined_rules_app" {
  count                       = "${var.nsg_enable  == 1 && var.subnet_count >= 2 ? length(var.nsg_tier2_rules) : 0}"
  name                        = "${var.nsg_tier2_rules[count.index]}"
  priority                    = "${element(var.rules[var.nsg_tier2_rules[count.index]], 0)}"
  direction                   = "${element(var.rules[var.nsg_tier2_rules[count.index]], 1)}"
  access                      = "${element(var.rules[var.nsg_tier2_rules[count.index]], 2)}"
  protocol                    = "${element(var.rules[var.nsg_tier2_rules[count.index]], 3)}"
  source_port_range           = "${element(var.rules[var.nsg_tier2_rules[count.index]], 4)}"
  destination_port_range      = "${element(var.rules[var.nsg_tier2_rules[count.index]], 5)}"
  description                 = "${element(var.rules[var.nsg_tier2_rules[count.index]], 6)}"
  source_address_prefix       = "${element(var.rules[var.nsg_tier2_rules[count.index]], 7)}"
  destination_address_prefix  = "${element(var.rules[var.nsg_tier2_rules[count.index]], 8)}" 
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${lower("nsg-${var.environment}-${var.nsg_name[1]}")}"
  depends_on                  = ["azurerm_network_security_group.networksg"]
}


# Source code for creating configured nsg rules for db layer
resource "azurerm_network_security_rule" "predefined_rules_db" {
  count                       = "${var.nsg_enable  == 1 && var.subnet_count >= 3 ? length(var.nsg_tier3_rules) : 0}"
  name                        = "${var.nsg_tier3_rules[count.index]}"
  priority                    = "${element(var.rules[var.nsg_tier3_rules[count.index]], 0)}"
  direction                   = "${element(var.rules[var.nsg_tier3_rules[count.index]], 1)}"
  access                      = "${element(var.rules[var.nsg_tier3_rules[count.index]], 2)}"
  protocol                    = "${element(var.rules[var.nsg_tier3_rules[count.index]], 3)}"
  source_port_range           = "${element(var.rules[var.nsg_tier3_rules[count.index]], 4)}"
  destination_port_range      = "${element(var.rules[var.nsg_tier3_rules[count.index]], 5)}"
  description                 = "${element(var.rules[var.nsg_tier3_rules[count.index]], 6)}"
  source_address_prefix       = "${element(var.rules[var.nsg_tier3_rules[count.index]], 7)}"
  destination_address_prefix  = "${element(var.rules[var.nsg_tier3_rules[count.index]], 8)}" 
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${lower("nsg-${var.environment}-${var.nsg_name[2]}")}"
  depends_on                  = ["azurerm_network_security_group.networksg"]
}


# Rule for app layer to accept inbound request from web layer
resource "azurerm_network_security_rule" "From_Tier2_To_Tier1_Inbound" {
  count                       =  "${var.nsg_enable  == 1 && var.subnet_count >= 2 ? 1 : 0}"
  name                        = "From-Tier2-To-Tier1-Inbound"
  priority                    = "300"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  description                 = "From_Tier2_To_Tier1_Inbound"
  source_address_prefix       = "${var.subnet_range[1]}"
  destination_address_prefix  = "*" 
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${lower("nsg-${var.environment}-${var.nsg_name[0]}")}"
  depends_on = ["azurerm_network_security_group.networksg"]
}


# Rule for web layer to accept response from app layer through inbound
resource "azurerm_network_security_rule" "From_Tier1_To_Tier2_Inbound" {
  count                       = "${var.nsg_enable == 1 && var.subnet_count >= 2 ? 1 : 0}"
  name                        = "From-Tier1-To-Tier2-Inbound"
  priority                    = "400"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  description                 = "From_Tier1_To_Tier2_Inbound"
  source_address_prefix       = "${var.subnet_range[0]}"
  destination_address_prefix  = "*" 
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${lower("nsg-${var.environment}-${var.nsg_name[1]}")}"
  depends_on                  = ["azurerm_network_security_group.networksg"]
}


# Rule for DB layer to accept request from app layer through inbound
resource "azurerm_network_security_rule" "From_Tier3_To_Tier2_Inbound" {
  count                       = "${var.nsg_enable  == 1 && var.subnet_count >= 3 ? 1 : 0}"
  name                        = "From-Tier3-To-Tier2-Inbound"
  priority                    = "500"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  description                 = "From_Tier3_To_Tier2_Inbound"
  source_address_prefix       = "${var.subnet_range[2]}"
  destination_address_prefix  = "*" 
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${lower("nsg-${var.environment}-${var.nsg_name[1]}")}"
  depends_on                  = ["azurerm_network_security_group.networksg"]
}


# Rule for App layer to accept response from DB layer through inbound
resource "azurerm_network_security_rule" "From_Tier2_To_Tier3_Inbound" {
  count                       =  "${var.nsg_enable  == 1 && var.subnet_count >= 3 ? 1 : 0}"
  name                        = "From-Tier2-To-Tier3-Inbound"
  priority                    = "600"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  description                 = "From_Tier2_To_Tier3_Inbound"
  source_address_prefix       = "${var.subnet_range[1]}"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${lower("nsg-${var.environment}-${var.nsg_name[2]}")}"
  depends_on                  = ["azurerm_network_security_group.networksg"]
}