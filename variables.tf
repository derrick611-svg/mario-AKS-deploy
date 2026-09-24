variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group."
  default     = "aks-learning-rg"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed."
  default     = "East US"
}

variable "cluster_name" {
  type        = string
  description = "Name of the Azure Kubernetes Service (AKS) cluster."
  default     = "mario-aks-cluster"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster."
  default     = "mario-aks-dns"
}

variable "node_count" {
  type        = number
  description = "Initial number of worker nodes in the default node pool."
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "VM SKU size for AKS nodes (Standard_B2s is low-cost and burstable)."
  default     = "Standard_B2s"
}

variable "environment" {
  type        = string
  description = "Tag indicating the deployment environment."
  default     = "Development"
}
