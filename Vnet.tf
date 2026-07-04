resource "azurerm_virtual_network" "VNET01" {
  name = "Nani_vnet01"
  resource_group_name = azurerm_resource_group.RG01.name
  location = azurerm_resource_group.RG01.location
  address_space = ["10.0.0.4"]
  }

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.RG01.name
  virtual_network_name = azurerm_virtual_network.VNET01.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "internal-nic"
  location            = azurerm_resource_group.RG01.location
  resource_group_name = azurerm_resource_group.RG01.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}