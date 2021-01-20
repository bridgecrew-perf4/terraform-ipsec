// Azure Variables

region = "eastus"

group_name = ""

gateway_name       = "local-network"
gateway_ip_address = ""   # The local router IP
gateway_address_space = [ # The local networks
  "192.168.15.0/24",
  "192.168.1.0/24"
]

network_cidr = "10.50.0.0/16"
network_name = "remote-network"

subnets = {
  subnet-01 = {
    name   = "subnet-01"
    subnet = "10.50.1.0/24"
  }
  subnet-02 = {
    name   = "subnet-02"
    subnet = "10.50.2.0/24"
  }
}

# The Azure API will let you retrieve the PSK that Azure creates
# However it seems the Azure Terraform provider will not return
# the Azure created PSK. If a PSK is provied by the user, then
# the Azure provider will return the PSK when it is queried.

shared_key = "Fortinet123!!"

virtual_gateway_connection_name = "local-to-remote"
virtual_gateway_name            = "remote-gateway"
virtual_gateway_public_ip_name  = "remote-vnet-gateway-ip"
virtual_gateway_subnet          = "10.50.0.0/24"