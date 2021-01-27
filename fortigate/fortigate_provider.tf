provider "fortios" {
  hostname = var.fortigate_ip_or_fqdn
  token    = var.fortigate_api_token
  insecure = "true"
}