resource "azurerm_linux_virtual_machine" "vm" {
  name                = "test-vm01"
  resource_group_name = azurerm_resource_group.RG01.name
  location            = azurerm_resource_group.RG01.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"

  # Attach the existing NIC ID here
  network_interface_ids = [
    azurerm_network_interface.test-nic.id
  ]
  admin_password                  = "SnackAttack#2026" # Use a strong, secure password
  disable_password_authentication = false


  # OS Disk Configuration
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Platform Image Reference (Ubuntu)
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}