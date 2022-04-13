resource "fortios_vpnipsec_phase1interface" "phase1" {
  #count = length(var.tunnel_info)

  for_each = var.tunnel_info

  name = each.key
  #name              = format("%s_%s", var.tunnel_name_prefix, count.index + 1)
  remote_gw = each.value.tunnel_ip
  #remote_gw         = var.tunnel_info[count.index].tunnel_ip

  nattraversal      = "disable"
  dpd               = "on-idle"
  dpd_retrycount    = 3
  dpd_retryinterval = "20"
  authmethod        = "psk"
  psksecret         = each.value.tunnel_psk
  #psksecret         = var.tunnel_info[count.index].tunnel_psk
  ike_version = "2"
  proposal    = var.tunnel_phase1_proposal
  dhgrp       = "2"
  keylife     = 28800
  interface   = var.fortigate_interface
  peertype    = "any"
}

resource "fortios_vpnipsec_phase2interface" "phase2" {
  #count = length(fortios_vpnipsec_phase1interface.phase1)

  for_each = fortios_vpnipsec_phase1interface.phase1

  name = each.value.name
  #name           = fortios_vpnipsec_phase1interface.phase1[count.index].name
  keylife_type   = "seconds"
  keylifeseconds = 27000
  replay         = "disable"
  pfs            = "disable"
  phase1name     = each.value.name
  #phase1name     = fortios_vpnipsec_phase1interface.phase1[count.index].name
  proposal = var.tunnel_phase2_proposal
}