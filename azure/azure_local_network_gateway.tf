resource "azurerm_local_network_gateway" "local_network_gateway" {
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  name                = var.gateway_name
  gateway_address     = var.gateway_ip_address
  address_space       = var.gateway_address_space

  tags = {
    environment = azurerm_resource_group.resource_group.name
  }
}