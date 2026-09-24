output "resource_group_name" {
  description = "The name of the Resource Group."
  value       = data.azurerm_resource_group.rg.name
}

output "aks_cluster_name" {
  description = "The name of the created AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "get_credentials_command" {
  description = "Azure CLI command to configure kubectl context."
  value       = "az aks get-credentials --resource-group ${data.azurerm_resource_group.rg.name} --name ${azurerm_kubernetes_cluster.aks.name}"
}
