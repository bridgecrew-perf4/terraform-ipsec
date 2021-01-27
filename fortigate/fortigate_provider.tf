terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
  required_version = ">= 0.13"
}

provider "fortios" {
  hostname = var.fortigate_ip_or_fqdn
  token    = var.fortigate_api_token
  insecure = "true"
}
