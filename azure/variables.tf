variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_cidr" {
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

variable "gateway_ip_address" {
  type = string
}

variable "gateway_address_space" {
  type = list(string)
}

variable "virtual_network_gateway_subnet" {
  type = string
}

variable "gateway_name" {
  type = string
}

variable "virtual_network_gateway_public_ip_name" {
  type = string
}

variable "virtual_network_gateway_name" {
  type = string
}

variable "virtual_network_gateway_connection_name" {
  type = string
}