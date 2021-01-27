resource "fortios_router_static" "static_route_tunnel" {
  count = length(var.tunnel_info)

  device   = format("%s_%s", var.tunnel_name_prefix, count.index + 1)
  distance = var.tunnel_info[count.index].tunnel_route_distance
  dst      = var.remote_cidr
  priority = 0
  status   = "enable"

  depends_on = [
    fortios_vpnipsec_phase1interface.phase1,
    fortios_vpnipsec_phase2interface.phase2,
  ]
}