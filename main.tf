# Resource Group
data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

# Managed Kubernetes Cluster (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  # Fix for OIDC Issuer disable error
  oidc_issuer_enabled = true

  default_node_pool {
    name       = "default"
  # node_count = var.node_count
    vm_size    = var.vm_size

    # --- Enable Cluster Autoscaler ---
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 5   # Adjust max nodes based on sandbox limits
  }

  identity {
    type = "SystemAssigned"
  }

  sku_tier = "Free"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
