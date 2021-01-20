resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = var.gateway_ip_address
  type       = "ipsec.1"

  tags = {
    Name  = var.gateway_name
    Group = var.group_name
  }
}