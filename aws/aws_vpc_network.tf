resource "aws_vpc" "vpc_network" {
  cidr_block           = var.network_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name  = var.network_name
    Group = var.group_name
  }
}

resource "aws_subnet" "subnets" {
  vpc_id = aws_vpc.vpc_network.id

  for_each   = var.subnets
  cidr_block = each.value["subnet"]
  tags = {
    Name  = each.value["name"]
    Group = var.group_name
  }
}