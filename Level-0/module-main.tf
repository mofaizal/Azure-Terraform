
module "Resources" {
  source = "./azure-resources/resource-layer"
    # Resources/Service Enable or Disable 
    rg_enable                                = 1
    vnet_enable                              = 1
    subnet_count                             = 3
    management_subnet_enable                 = 1
    er_subnet_enable                         = 1
    nsg_enable                               = 1
    rt_enable                                = 1
    vnet_peering_enable                      = 1

    # Parameter Definition for the Azure Network Foundation components
    resource_group_name                      = "${var.resource_group_name}"
    region                                   = "${var.region}"
    vnet_name                                = "${var.vnet_name}"
    vnet_address                             = "${var.vnet_address}"
    subnet_names                             = "${var.subnet_names}"
    subnet_range                             = "${var.subnet_range}"
    nsg_tier1_rules                          = "${var.nsg_tier1_rules}"
    nsg_tier2_rules                          = "${var.nsg_tier2_rules}"
    nsg_tier3_rules                          = "${var.nsg_tier3_rules}"
    nsg_name                                 = "${var.nsg_names}"
    rt_name                                  = "${var.rt_names}"
    subnet_er                                = "${var.subnet_er}"
    subnet_er_range                          = "${var.subnet_er_range}"
    subnet_management                        = "${var.subnet_management}"
    subnet_management_range                  = "${var.subnet_management_range}"

    # Parameter Definition for the Tag and Values
    tagvalue                                 = "${var.tagvalue}"
    environment                              = "${var.environment}"
      
}
