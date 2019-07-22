# Module to Create Public IP Address for VM
module "public_ip_vm" {
  source                                  = "../public-ip"
  public_ip_enable                        = "${var.public_ip_enable}"
  public_ip_names                         = ["${var.vm_public_ip_name}"]
  allocation                              = "${var.public_ip_allocation_method}"
  region                                  = "${var.region}"
  resource_group_name                     = "${var.resource_group_name}"
  environment                             = "${var.environment}"
  sku_type                                = "${var.sku_type}"
  tagvalue                                = "${var.tagvalue}"
}


# Module to create NIC
module "network_interface" {
  source                                  = "../network-interface"
  nic_enable                              = "${var.nic_enable}"
  resource_group_name                     = "${var.resource_group_name}"
  region                                  = "${var.region}"
  subnet_names                            = "${lower("subnet-${var.environment}-${var.subnet_names[0]}")}"
  vnet_name                               = "${var.vnet_name}"
  nic_name                                = "${var.nic_name}"
  ip_allocation_method                    = "${var.nic_ip_allocation_method}"
  nic_public_ip_address_id                = "${module.public_ip_vm.public_ip_address_id[0]}"
  nic_type                                = "${var.nic_type}" 
  ip_config_name                          = "${var.nic_ip_config_name}"
  environment                             = "${var.environment}"
  tagvalue                                = "${var.tagvalue}"
}


# Module to create virtual machine
module "virtual_machine" {
  source                                  = "../virtual-machine"
  resource_group_name                     = "${var.resource_group_name}"
  region                                  = "${var.region}"
  vm_enable                               = "${var.vm_enable}"  
  vm_name                                 = "${var.vm_name}"
  nic_id                                  = ["${module.network_interface.nic}"]
  #nic_id                                  = "${module.network_interface.nic}"
  vm_size                                 = "${var.vm_size}"
  image_publisher                         = "${var.image_publisher}"
  image_offer                             = "${var.image_offer}"
  image_version                           = "${var.image_version}"
  image_sku                               = "${var.image_sku}"
  vm_os_disk_name                         = "${var.vm_os_disk_name}"
  os_caching                              = "${var.os_caching}"
  create_option                           = "${var.create_option}"
  managed_disk_type                       = "${var.managed_disk_type}"
  computer_name                           = "${var.computer_name}"
  admin_username                          = "${var.admin_username}"
  admin_password                          = "${var.admin_password}"
  disable_password_authentication         = "${var.disable_password_authentication}"
  environment                             = "${var.environment}"
  tagvalue                                = "${var.tagvalue}"
}
