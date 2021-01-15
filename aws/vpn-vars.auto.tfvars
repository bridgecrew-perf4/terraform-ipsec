// AWS Variables

group_tag          = "s2s-vpn"
region             = "us-east-1"
vpc_name           = "vpc-remote"
vpc_cidr           = "10.60.0.0/16"
gateway_name       = "local-network"
gateway_ip_address = ""   # The local router IP
gateway_address_space = [ # The local networks
  "192.168.15.0/24",
  "192.168.1.0/24"
]

virtual_private_gateway_name = "remote-vpc-gateway"

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
