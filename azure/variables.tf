variable "gateway_ip_address" {
  type = string
}

variable "gateway_name" {
  type = string
}

variable "gateway_address_space" {
  type = list(string)
}

variable "group_name" {
  type = string
}

variable "network_cidr" {
  type = string
}

variable "network_name" {
  type = string
}

variable "region" {
  type = string
}

variable "shared_key" {
  type = string
}

variable "subnets" {
  type = map(object({
    name   = string
    subnet = string
  }))
}

variable "virtual_gateway_connection_name" {
  type = string
}

variable "virtual_gateway_name" {
  type = string
}
variable "virtual_gateway_public_ip_name" {
  type = string
}
variable "virtual_gateway_subnet" {
  type = string
}