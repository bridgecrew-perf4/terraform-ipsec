resource "aws_route" "route" {
  count = length(var.gateway_address_space)

  route_table_id         = aws_vpc.vpc_network.default_route_table_id
  destination_cidr_block = var.gateway_address_space[count.index]
  gateway_id             = aws_vpn_gateway.vpn_gateway.id
}