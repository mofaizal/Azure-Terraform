

# Variable Declaration for Resource group name
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default =  "RG_"
}


# Variable Declaration for Location
variable "region" {
  description = "The location/region where resources is created. Changing this forces a new resource to be created."
  default = "UK South"
}

# Varaible declaration for vnet name
variable "vnet_name" {
  
}


# Varaible declaration for subnetsnet name
variable "subnet_names" {
  type = "list"
}
# Variable Declaration for  Tag Value
variable "tagvalue" {
    description = "The value for the tag"
    type = "map"
}


# Variable Declaration for Environment
variable "environment" {
    description = "The environment name to be provided"
  
}


# Variable Declaration for Public IP Enable
variable "public_ip_enable" {
  description = "The name Public IP enable"
  default = 0
}

# Variable Declaration for Public IP Name VM
variable "vm_public_ip_name" {
  
}

# Variable Declaration for Publicc IP Allocation Method
variable "public_ip_allocation_method" {
  description = "The Public Ip Allocation Method"
  default = ""
}


# Variable Declaration for Publicc IP Allocation Method
variable "private_ip_allocation_method" {
  description = "The Private Ip Allocation Method"
  default = ""
}

# Variable declaration for frontend ip name

variable "frontend_ip_name" {
  type = "list"
  default = []
}

# Variable declaration for nic nable
variable "nic_enable" {
  default = 1
}

# Variable declaration for NIC Name
variable "nic_name" {
  default = ""
}

# Variable declaration for NIC Type
variable "nic_type" {
 default = "" 
}


# Variable declaration for NIC Ip config name

variable "nic_ip_config_name" {
 default = "" 
}

# Variable declaration for Ip allocation type
variable "nic_ip_allocation_method" {
  default = "static"
}
# Variable Declaration for Virtual Machine Enable
variable "vm_enable" {
 default = 1 
}

# Variable Declaration for Virtual Machine Name
variable "vm_name" {
  
}


# Variable Declaration for Virtual Machine Size
variable "vm_size" {
  
}

# Variable Declaration for Image Publisher
variable "image_publisher" {
  
}

# Varable Declaration for Image Offer
variable "image_offer" {
  
}

# Variable Declaration for Image Version
variable "image_version" {
  
}


# Variable Declaration for Image SKU
variable "image_sku" {
  
}

# Variable Declaration for Virtual Machine OS Disk Name
variable "vm_os_disk_name" {
  
}



# Variable Declaration for OS Caching
variable "os_caching" {
  
}

# Variable Declaration for Create Option
variable "create_option" {
  
}

# Variable Declaration for Managed Disk Type
variable "managed_disk_type" {
  
}

# Variable Declaration for Computer Name
variable "computer_name" {
  
}

# Variable Declaration for Admin User Name
variable "admin_username" {
  
}
# Variable Declaration for Admin Password
variable "admin_password" {
  
}


# Variable Declaration for Password Authentication
variable "disable_password_authentication" {
 default = "false" 
}

variable "sku_type" {
  default = "Standard"
}
