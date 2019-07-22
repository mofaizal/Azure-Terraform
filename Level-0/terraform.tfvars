# Name for the environment
environment                              = "dev"

# Parameter for Creating Azure Resources
region                                   = "Southeast Asia"
resource_group_name                      = "githubnetworking"
# Parameter for Create Virtual network and Subnets
vnet_name                                = ["cloud-engg-project1","cloud-engg-project2"]
vnet_address                             = ["10.100.0.0/16","10.200.0.0/16"]
subnet_names                             = ["Web","App","DB"]
subnet_er                                = ["GatewaySubnet"]
subnet_management                        = ["management"]
subnet_er_range                          = ["10.100.3.0/24"]
subnet_management_range                  = ["10.100.4.0/24"]
subnet_range                             = ["10.100.0.0/24","10.100.1.0/24","10.100.2.0/24"]

# Parameter for Create Network Security Groups
nsg_names                                = ["Web","App","DB"]
nsg_tier1_rules                          = ["Allow_Port80_Inbound","Allow_Port443_Inbound","Allow_Port3389_Inbound","Deny_Virtualnetwork_Inbound"]
nsg_tier2_rules                          = ["Deny_Virtualnetwork_Inbound","Allow_Azuremonitor_Outbound","Deny_Internet_Outbound"]
nsg_tier3_rules                          = ["Deny_Virtualnetwork_Inbound","Allow_Azuremonitor_Outbound","Deny_Internet_Outbound"]

# Parameter for Create Route Table
rt_names                                 = ["Web","App","DB","gateway","management"]

# Parameter for Azure Resources Tags
tagvalue                           =  {

      environment                  = "Development"
}  

