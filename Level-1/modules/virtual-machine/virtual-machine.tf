#Resourcee creation for virtual machine
resource "azurerm_virtual_machine" "virtual_machine" {
  count                            = "${var.vm_enable == 1 ? 1 : 0}"
  name                             = "${lower("vm-${var.environment}-${var.vm_name}")}"
  network_interface_ids            = ["${var.nic_id}"]
  resource_group_name              = "${var.resource_group_name}"
  location                         = "${var.region}"
  vm_size                          = "${var.vm_size}"


  storage_image_reference {
    publisher                      = "${var.image_publisher}"
    offer                          = "${var.image_offer}"
    sku                            = "${var.image_sku}"
    version                        = "${var.image_version}"
  }
  storage_os_disk {
    name                           = "${lower("vm-${var.environment}-${var.vm_os_disk_name}")}"
    caching                        = "${var.os_caching}"
    create_option                  = "${var.create_option}"
    managed_disk_type              = "${var.managed_disk_type}"
  }
  os_profile {
    computer_name                  = "${var.computer_name}"
    admin_username                 = "${var.admin_username}"
    admin_password                 = "${var.admin_password}"
  }
  os_profile_windows_config {
    
  }
  tags                             = "${var.tagvalue}"
}
