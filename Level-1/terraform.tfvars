# Parameter for Creating Azure Resources
resource_group_name                         = "githubnetworking"
region                                      = "Southeast Asia"



# Parameter for Create Virtual network and Subnets
vnet_name                                   = "cloud-engg-project1"
subnet_names                                = ["web","app","DB"]

# Parameter for Azure Resources Tags
tagvalue                                    =  {

      environment                  = "testing"
      project                      = "test_project"
}  
environment                                 = "dev"

# Parameter for the Public IP Creation VM
public_ip_allocation_method                 = "Static"
vm_public_ip_name                           = "vm-project1"

# Parameter for Network Interface
nic_name                                    = "web"
nic_ip_config_name                          = "nic_i_config"
nic_ip_allocation_method                    = "Dynamic"
nic_type                                    = "Public"

#parameters for virtual machine
vm_name                                     = "project1"
vm_size                                     = "Standard_B1s"
image_publisher                             = "MicrosoftWindowsServer"
image_offer                                 = "WindowsServer"
image_version                               = "latest"
image_sku                                   = "2016-Datacenter"
vm_os_disk_name                             = "disk1"
os_caching                                  = "ReadWrite"
create_option                               = "FromImage"
managed_disk_type                           = "Standard_LRS"
computer_name                               = "hostname"
admin_username                              = "vm-admin"
admin_password                              = "Welcome1234!"