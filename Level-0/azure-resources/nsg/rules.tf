# The pre-configurable rules for the network security groups
variable "rules" {
    type = "map"
    default = {
    Allow_Port80_Inbound            = ["100", "Inbound", "Allow", "*", "*", "80", "Allowport80" ,"*" , "*"]
	Allow_Port3389_Inbound          = ["110", "Inbound", "Allow", "*", "*", "3389", "Allowport3389", "*", "*"]
    Allow_Port443_Inbound           = ["200", "Inbound", "Allow", "*", "*", "443", "Allowport443" ,"*" , "*"]
    Deny_Virtualnetwork_Inbound     = ["4096", "Inbound", "Deny", "*", "*", "*", "DenyVirtualNetwork" ,"VirtualNetwork" ,"VirtualNetwork"]
    Allow_Azuremonitor_Outbound     = ["100", "Outbound", "Allow", "*", "*", "*", "Allowazuremonitor" ,"VirtualNetwork" ,"azureMonitor"]
    Deny_Virtualnetwork_Outbound    = ["4096", "Outbound", "Deny", "*", "*", "*", "DenyVirtualNetwork" ,"VirtualNetwork" ,"VirtualNetwork"]
    Deny_Internet_Outbound          = ["4086", "Outbound", "Deny", "*", "*", "*", "DenyInternet" ,"*" , "Internet"]
}
}