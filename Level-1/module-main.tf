

# Module to create application
module "virtual_machine" {
source                                      = "./modules/application-layer"
vm_enable                                   = 1
nic_enable                                  = 1
public_ip_enable                            = 1


resource_group_name                         = "rg-${var.environment}-${var.resource_group_name}"
region                                      = "${var.region}"

# Parameter for Virtual network and Subnets
vnet_name                                   = "vnet-${var.environment}-${var.vnet_name}"
subnet_names                                = "${var.subnet_names}"

# Parameter for Azure Resources Tags
tagvalue                                    = "${var.tagvalue}"  
environment                                 = "${var.environment}"

# Parameter for the Public IP Creation VM
public_ip_allocation_method                 = "${var.public_ip_allocation_method}"
vm_public_ip_name                           = "${var.vm_public_ip_name}"

# Parameter for Network Interface
nic_name                                    = "${var.nic_name}"
nic_ip_config_name                          = "${var.nic_ip_config_name}"
nic_ip_allocation_method                    = "${var.nic_ip_allocation_method}"
nic_type                                    = "${var.nic_type}"

#parameters for virtual machine
vm_name                                     = "${var.vm_name}"
vm_size                                     = "${var.vm_size}"
image_publisher                             = "${var.image_publisher}"
image_offer                                 = "${var.image_offer}"
image_version                               = "${var.image_version}"
image_sku                                   = "${var.image_sku}"
vm_os_disk_name                             = "${var.vm_os_disk_name}"
os_caching                                  = "${var.os_caching}"
create_option                               = "${var.create_option}"
managed_disk_type                           = "${var.managed_disk_type}"
computer_name                               = "${var.computer_name}"
admin_username                              = "${var.admin_username}"
admin_password                              = "${var.admin_password}"
}