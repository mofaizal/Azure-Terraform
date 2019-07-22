# Returns the output of Resource Group Name
output "resource_group_name" {
  value = "${module.Resources.resource_group_name}"
}

# Returns the output of Region Name
output "region" {
  value       = "${module.Resources.region}"
}

# Returns the output of VNet Name
output "vnet_name" {
  value       = "${module.Resources.vnet_name}"
}

# Returns the output of Peering Vnet Names
output "vnet_address_space" {
  value       = "${module.Resources.vnet_address_space}"
}

# Returns the output of Subent Names
output "vnet_subnets" {
  value       = "${module.Resources.vnet_subnets}"
}

# Returns the output of Subnet IDs
output "subnet_id" {
  value       = "${module.Resources.subnet_id}"
}

# Returns the output of NSGs names
output "nsg_names" {
  value        = "${module.Resources.nsg_names}"
}


# Returns the output of  NSG IDs
output "nsg_id" {
  value       = "${module.Resources.nsg_id}"
}

# Returns the output of Route Table IDs
output "rt_id" {
  value       = "${module.Resources.rt_id}"
}

# Returns the output of Route Tables Names
output "rt_name" {
  value       = "${module.Resources.rt_name}"
}