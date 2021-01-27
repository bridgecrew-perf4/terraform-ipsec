variable "group_name" {
  type = string
}

variable "network_cidr" {
  type = string
}

variable "network_name" {
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

variable "region" {
  type = string
}

variable "subnets" {
  type = map(object({
    name   = string
    subnet = string
  }))
}

variable "virtual_gateway_name" {
  type = string
}
