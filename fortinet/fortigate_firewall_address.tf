resource "fortios_firewall_address" "address" {
  name       = var.firewall_address_name
  subnet     = var.remote_cidr
  type       = "ipmask"
  visibility = "enable"
}