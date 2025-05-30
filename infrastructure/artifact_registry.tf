resource "azurerm_container_registry" "acr" {
  name                = "crisscontainerregistry"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = "Basic"
}