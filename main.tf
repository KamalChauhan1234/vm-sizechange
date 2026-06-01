data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_network_interface" "nic" {
  name                = "vm1352"        # STEP 2 ka output yahan
  resource_group_name = var.resource_group_name
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = "centralindia"
  size                = var.vm_size

  admin_username = "azureadmin"
  admin_password = "azureadmin@1234"

  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-datacenter-azure-edition"
    version   = "latest"
  }
}