module "fortigate" {

  source = "../fortinet"

  fortigate_api_token  = ""
  fortigate_ip_or_fqdn = ""

  tunnel_name_prefix    = "AZUREVPN"
  firewall_address_name = "AZUREVPN_${var.vnet_name}"
  remote_cidr           = var.vnet_cidr

  tunnel_phase1_proposal = "aes256-sha1 3des-sha1 aes256-sha256"
  tunnel_phase2_proposal = "aes256-sha1 3des-sha1 aes256-sha256"

  # Azure creates a single tunnel
  tunnel_info = [
    {
      tunnel_ip             = azurerm_public_ip.public_ip.ip_address
      tunnel_psk            = var.shared_key
      tunnel_route_distance = 2
    },
  ]
}