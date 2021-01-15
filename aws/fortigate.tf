module "fortigate" {

  source = "../fortinet"

  fortigate_api_token  = ""
  fortigate_ip_or_fqdn = ""

  tunnel_name_prefix    = "AWSVPN"
  firewall_address_name = "AWSVPN_${var.vpc_name}"
  remote_cidr           = var.vpc_cidr

  tunnel_phase1_proposal = "aes128-sha1"
  tunnel_phase2_proposal = "aes128-sha1"

  # AWS Creates two tunnels
  tunnel_info = [
    {
      tunnel_ip             = aws_vpn_connection.site_to_site.tunnel1_address
      tunnel_psk            = aws_vpn_connection.site_to_site.tunnel1_preshared_key
      tunnel_route_distance = 2
    },
    {
      tunnel_ip             = aws_vpn_connection.site_to_site.tunnel2_address
      tunnel_psk            = aws_vpn_connection.site_to_site.tunnel2_preshared_key
      tunnel_route_distance = 3
    },
  ]
}