// Azure Variables

resource_group     = "s2s-vpn"
location           = "eastus"
vnet_name          = "vnet-remote"
vnet_cidr          = "10.50.0.0/16"
gateway_name       = "local-network"
gateway_ip_address = ""   # The local router IP
gateway_address_space = [ # The local networks
  "192.168.15.0/24",
  "192.168.1.0/24"
]

virtual_network_gateway_name = "remote-vnet-gateway"

virtual_network_gateway_connection_name = "local-to-remote"
virtual_network_gateway_public_ip_name  = "remote-vnet-gateway-ip"
virtual_network_gateway_subnet          = "10.50.0.0/24"

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