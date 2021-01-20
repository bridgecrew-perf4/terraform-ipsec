// AWS Variables

region = "us-east-1"

group_name = "" # Used for tagging related components 

gateway_name       = "local-network"
gateway_ip_address = ""   # The local router IP
gateway_address_space = [ # The local networks
  "192.168.15.0/24",
  "192.168.1.0/24"
]

network_cidr = "10.60.0.0/16"
network_name = "remote-network"

subnets = {
  subnet-01 = {
    name   = "subnet-01"
    subnet = "10.60.1.0/24"
  }
  subnet-02 = {
    name   = "subnet-02"
    subnet = "10.60.2.0/24"
  }
}

virtual_gateway_name = "remote-gateway"