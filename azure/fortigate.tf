module "fortigate" {

  source = "../fortigate"

  fortigate_api_token  = var.fortigate_api_token
  fortigate_ip_or_fqdn = var.fortigate_ip_or_fqdn

  tunnel_name_prefix    = var.tunnel_name_prefix
  firewall_address_name = "${var.tunnel_name_prefix}_${var.network_name}"
  remote_cidr           = var.network_cidr

  tunnel_phase1_proposal = var.tunnel_phase1_proposal
  tunnel_phase2_proposal = var.tunnel_phase2_proposal

  fortigate_interface = var.fortigate_interface

  # Azure creates a single tunnel by default
  tunnel_info = {
    azure_tunnel_1 = {
      tunnel_ip             = azurerm_public_ip.public_ip.ip_address
      tunnel_psk            = var.shared_key
      tunnel_route_distance = 2
    }
  }
}