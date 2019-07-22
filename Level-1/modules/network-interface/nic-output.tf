#Returns the output of NIC ID
output "nic" {
  value = "${azurerm_network_interface.nic.*.id}"
}


