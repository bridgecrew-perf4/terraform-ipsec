resource "azurerm_subnet" "subnet_gateway" {

  depends_on = [azurerm_virtual_network.virtual_network]

  name                 = "GatewaySubnet"
  address_prefixes     = [var.virtual_network_gateway_subnet]
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name

}

resource "azurerm_public_ip" "public_ip" {
  name                = var.virtual_network_gateway_public_ip_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location

  allocation_method = "Dynamic"

  tags = {
    environment = azurerm_resource_group.resource_group.name
  }
}

resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name                = var.virtual_network_gateway_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = azurerm_public_ip.public_ip.name
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet_gateway.id
  }

  tags = {
    environment = azurerm_resource_group.resource_group.name
  }
}

resource "azurerm_virtual_network_gateway_connection" "connection" {
  name                = var.virtual_network_gateway_connection_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.virtual_network_gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.local_network_gateway.id

  shared_key = var.shared_key

  tags = {
    environment = azurerm_resource_group.resource_group.name
  }
}