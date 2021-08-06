resource "fortios_firewall_policy" "to_tunnel" {
  count = length(var.tunnel_info)

  action     = "accept"
  logtraffic = "utm"
  nat        = "disable"
  status     = "enable"
  schedule   = "always"

  name = format("to_%s_%s", var.tunnel_name_prefix, count.index + 1)
  srcintf {
    name = "internal"
  }

  dstintf {
    name = format("%s_%s", var.tunnel_name_prefix, count.index + 1)
  }
  srcaddr {
    name = "all"
  }

  dstaddr {
    name = fortios_firewall_address.address.name
  }

  service {
    name = "ALL"
  }

  depends_on = [
    fortios_vpnipsec_phase1interface.phase1,
    fortios_vpnipsec_phase2interface.phase2,
  ]
}

resource "fortios_firewall_policy" "from_tunnel" {
  count = length(var.tunnel_info)

  action   = "accept"
  nat      = "disable"
  status   = "enable"
  schedule = "always"

  name = format("from_%s_%s", var.tunnel_name_prefix, count.index + 1)
  srcintf {
    name = format("%s_%s", var.tunnel_name_prefix, count.index + 1)
  }

  dstintf {
    name = "internal"
  }
  srcaddr {
    name = fortios_firewall_address.address.name
  }

  dstaddr {
    name = "all"
  }

  service {
    name = "ALL"
  }

  depends_on = [
    fortios_vpnipsec_phase1interface.phase1,
    fortios_vpnipsec_phase2interface.phase2,
  ]
}
