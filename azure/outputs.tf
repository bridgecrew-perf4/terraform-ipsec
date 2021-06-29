// Tunnel Public IP ans PreShared Keys

output "azure_tunnel_public_ip" {
  value       = azurerm_public_ip.public_ip.ip_address
  description = "Azure VPN Tunnel Public IP"
}

output "azure_shared_secret" {
  value       = azurerm_virtual_network_gateway_connection.connection.shared_key
  description = "Azure VPN Tunnel Shared Key"
  sensitive = true
}