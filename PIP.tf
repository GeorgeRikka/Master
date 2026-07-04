resource "azurerm_public_ip" "pip01" {
  name                = "TestPublicIp1"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location
  allocation_method   = "Static"
}