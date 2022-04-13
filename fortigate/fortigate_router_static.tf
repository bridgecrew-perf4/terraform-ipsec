resource "fortios_router_static" "static_route_tunnel" {
  #count = length(var.tunnel_info)

  for_each = var.tunnel_info

  device = each.key
  #device   = format("%s_%s", var.tunnel_name_prefix, count.index + 1)
  distance = each.value.tunnel_route_distance
  #distance = var.tunnel_info[count.index].tunnel_route_distance
  dst      = var.remote_cidr
  priority = 1
  status   = "enable"

  depends_on = [
    fortios_vpnipsec_phase1interface.phase1,
    fortios_vpnipsec_phase2interface.phase2
  ]
}