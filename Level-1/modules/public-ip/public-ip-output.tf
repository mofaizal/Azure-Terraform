# Returns the output Pubblic IP Address created
output "public_ip_address" {
  value = "${azurerm_public_ip.public_ip.*.ip_address}"
}


# Returnsthe output for Public IP ID created
output "public_ip_address_id" {
  value = "${azurerm_public_ip.public_ip.*.id}"
}