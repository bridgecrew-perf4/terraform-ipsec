resource "aws_vpn_connection" "site_to_site" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name  = var.gateway_name
    Group = var.group_name
  }
}

resource "aws_vpn_connection_route" "connection_route" {
  count = length(var.gateway_address_space)

  destination_cidr_block = var.gateway_address_space[count.index]
  vpn_connection_id      = aws_vpn_connection.site_to_site.id
}