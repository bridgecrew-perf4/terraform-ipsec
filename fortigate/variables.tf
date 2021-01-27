
variable "fortigate_ip_or_fqdn" {
  type = string
}

variable "fortigate_api_token" {
  type = string
}

variable "fortigate_interface" {
  type = string
}
variable "tunnel_name_prefix" {
  type = string
}

variable "remote_cidr" {
  type = string
}

variable "firewall_address_name" {
  type = string
}

variable "tunnel_phase1_proposal" {
    type = string
}

variable "tunnel_phase2_proposal" {
    type = string
}

variable "tunnel_info" {
  type = list(object({
    tunnel_ip = string
    tunnel_psk = string
    tunnel_route_distance = number
  }))
}