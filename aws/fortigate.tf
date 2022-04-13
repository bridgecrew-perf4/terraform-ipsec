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

  # AWS Creates two tunnels
  tunnel_info = {
    aws_tunnel_1 = {
      tunnel_ip             = aws_vpn_connection.site_to_site.tunnel1_address
      tunnel_psk            = aws_vpn_connection.site_to_site.tunnel1_preshared_key
      tunnel_route_distance = 2
    }
    aws_tunnel_2 = {
      tunnel_ip             = aws_vpn_connection.site_to_site.tunnel2_address
      tunnel_psk            = aws_vpn_connection.site_to_site.tunnel2_preshared_key
      tunnel_route_distance = 3
    }
  }
}