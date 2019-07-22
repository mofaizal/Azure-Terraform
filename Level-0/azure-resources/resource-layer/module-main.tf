# Modules definition for creating Key Vault's resource group
module "resource_group" {
 source                              = "../../../common-modules/resource-group"
 resource_group_name                 = "${var.resource_group_name}"
 region                              = "${var.region}"
 tagvalue                            = "${var.tagvalue}"
 environment                         = "${var.environment}"
}



# Module to create Vnet for our project
module "projectvnet" {
  source                                  = "../vnet"
  resource_group_name                     = "${module.resource_group.resource_group_name}"
  vnet_enable                             = "${var.vnet_enable}"
  region                                  = "${var.region}"
  vnet_name                               = "${var.vnet_name}"
  vnet_address                            = "${var.vnet_address}"
  tagvalue                                = "${var.tagvalue}"
  environment                             = "${var.environment}"
 }

# Module to create Subnets
module "projectsubnet" {
  source                                  = "../subnet"
  resource_group_name                     = "${module.resource_group.resource_group_name}"
  subnet_count                            = "${var.subnet_count}"
  vnet_name                               = "${module.projectvnet.vnet_name[0]}"
  subnet_names                            = "${var.subnet_names}"
  subnet_range                            = "${var.subnet_range}"
  environment                             = "${var.environment}"
  service_endpoints                       = "${var.service_endpoints}"
  service_endpoints_enable                 = "${var.service_endpoints_enable}"
 }


# Module to create NSG for our project
module "projectnsg" {
  source                                  = "../nsg"
  nsg_enable                              = "${var.nsg_enable}"
  nsg_name                                = "${var.nsg_name}"
  subnet_count                            = "${var.subnet_count}"
  region                                  = "${var.region}"
  resource_group_name                     = "${module.resource_group.resource_group_name}"
  subnet_range                            = "${var.subnet_range}"
  nsg_tier1_rules                         = "${var.nsg_tier1_rules}"
  nsg_tier2_rules                         = "${var.nsg_tier2_rules}"
  nsg_tier3_rules                         = "${var.nsg_tier3_rules}"
  environment                             = "${var.environment}"
  tagvalue                                = "${var.tagvalue}"
  }


# Module for Subnet Associations with NSG's
module "nsg_association_subnet_Tiers" {
    source                                = "../nsg-association"
    nsg_enable                            = "${var.nsg_enable}"
    subnet_count                          = "${var.subnet_count}"
    subnet_id                             = "${module.projectsubnet.subnet_id}"
    nsg_id                                = "${module.projectnsg.nsg_id}"
    
}


# Module to create Routetables
module "projectrt" {
    source                                = "../routetable"
    rt_enable                             = "${var.rt_enable}"
    subnet_count                          = "${var.subnet_count}"
    rt_name                               = "${var.rt_name}"
    resource_group_name                   = "${module.resource_group.resource_group_name}"
    region                                = "${var.region}"
    tagvalue                              = "${var.tagvalue}"
    environment                           = "${var.environment}"
   }


# Module for routatable association with All Tier subnets
module "rt_association_subnet_Tier1" {
    source                                = "../routetable-association"
    rt_enable                             = "${var.rt_enable}"
    subnet_count                          = "${var.subnet_count}"
    subnet_id                             = "${module.projectsubnet.subnet_id}"
    rt_id                                 = "${module.projectrt.rt_id}"
    }


# Module for routatable association with ER subnet
module "rt_association_ER_subnet" {
    source                                = "../routetable-association"
    rt_enable                             = "${var.rt_enable}"
    subnet_count                          = "${var.er_subnet_enable}"
    subnet_id                             = "${module.projectsubnet_er.subnet_id}"
    rt_id                                 = "${module.projectrt_er.rt_id}"
    }


# Module for routatable association with managment subnet
module "rt_association_Management_subnet" {
    source                                = "../routetable-association"
    rt_enable                             = "${var.rt_enable}"
    subnet_count                          = "${var.management_subnet_enable}"
    subnet_id                             = "${module.projectsubnet_management.subnet_id}"
    rt_id                                 = "${module.projectrt_management.rt_id}"
 }


# Module to create ER Subnet
module "projectsubnet_er" {
  source                                  = "../subnet"
  resource_group_name                     = "${module.resource_group.resource_group_name}"
  subnet_count                            = "${var.er_subnet_enable}"
  vnet_name                               = "${module.projectvnet.vnet_name[0]}"
  subnet_names                            = "${var.subnet_er}"
  subnet_range                            = "${var.subnet_er_range}"
  environment                             = "${var.environment}"
  }


# Module to create Management subnet
module "projectsubnet_management" {
  source                                  = "../subnet"
  resource_group_name                     = "${module.resource_group.resource_group_name}"
  subnet_count                            = "${var.management_subnet_enable}"
  vnet_name                               = "${module.projectvnet.vnet_name[0]}"
  subnet_names                            = "${var.subnet_management}"
  subnet_range                            = "${var.subnet_management_range}"
  environment                             = "${var.environment}"
 }


# Module to create Routatable for ER subnet
module "projectrt_er" {  
    source                                = "../routetable"
    rt_enable                             = "${var.rt_enable}"
    subnet_count                          = "${var.er_subnet_enable == 1 && var.rt_enable == 1 ? 1 : 0}"
    rt_name                               = ["${var.rt_name[3]}"]
    resource_group_name                   = "${module.resource_group.resource_group_name}"
    tagvalue                              = "${var.tagvalue}"
    environment                           = "${var.environment}"
    region                                = "${var.region}"
    }


# Module to create Routatable for Management subnet
module "projectrt_management" {
    source                                = "../routetable"
    rt_enable                             = "${var.rt_enable}"
    subnet_count                          = "${var.management_subnet_enable == 1 && var.rt_enable == 1 ? 1 : 0}" 
    rt_name                               = ["${var.rt_name[4]}"]
    resource_group_name                   = "${module.resource_group.resource_group_name}"
    tagvalue                              = "${var.tagvalue}"
    environment                           = "${var.environment}"
    region                                = "${var.region}"
    }
# Module to Enable VNet Peer
module "vnet_peering" {
 source                                   = "../vnet-peering"
 vnet_peering_enable                      = "${var.vnet_peering_enable}"
 resource_group_name                      = "${module.resource_group.resource_group_name}"
 region                                   = "${var.region}"
 vnet_id                                  = "${module.projectvnet.vnet_id[1]}"
 vnet1_id                                 = "${module.projectvnet.vnet_id[0]}"
 vnet_name                                = ["${var.vnet_name[0]}","${var.vnet_name[1]}"]
 peer2_resource_group                     = "${module.resource_group.resource_group_name}"
 allow_virtual_network_access             = "true"
 environment                              = "${var.environment}"
 }
