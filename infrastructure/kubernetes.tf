resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "uny_kube"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = "unycrisskube"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_d4s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_role_assignment" "kube_role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.kubernetes.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}