variable "region" {
  type = string
}

variable "subnets" {
  type = map(object({
    name   = string
    subnet = string
  }))
}

variable "group_tag" {
  type = string
}

variable "virtual_private_gateway_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "gateway_ip_address" {
  type = string
}

variable "gateway_name" {
  type = string
}

variable "gateway_address_space" {
  type = list(string)
}