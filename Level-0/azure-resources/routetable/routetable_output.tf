# Returns the output of the route table ID
output "rt_id" {
  value = "${azurerm_route_table.routetable.*.id}"
}

# Returns the output of the route table name
output "rt_name" {
    value = "${azurerm_route_table.routetable.*.name}"
}

