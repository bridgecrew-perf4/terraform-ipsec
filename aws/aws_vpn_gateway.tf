resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = aws_vpc.vpc_network.id

  tags = {
    Name  = var.virtual_private_gateway_name
    Group = var.group_tag
  }
}