resource "aws_vpc" "vpc_network" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name  = var.vpc_name
    Group = var.group_tag
  }
}

resource "aws_subnet" "vpc_subnets" {
  vpc_id = aws_vpc.vpc_network.id

  for_each   = var.subnets
  cidr_block = each.value["subnet"]
  tags = {
    Name  = each.value["name"]
    Group = var.group_tag
  }
}