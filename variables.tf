variable "location" {
  type    = string
  default = "uksouth"
  description = "Set region"
}

variable "rg_name" {
  type    = string
  default = "aks-cluster"
  description = "Set resource group name"
}

variable "vnet_name" {
  type    = string
  default = "aks-vnet"
  description = "Set vnet name"
}

variable "subnet_name" {
  type    = string
  default = "aks-subnet"
  description = "Set aks subnet name"
}

variable "cluster_name" {
  type    = string
  default = "aks"
  description = "Set cluster name"
}

variable "kubernetes_version" {
  type    = string
  default = "1.14.8"
  description = "Set k8s version"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
  description = "Set vm type"
}

variable "type" {
  type    = string
  default = "VirtualMachineScaleSets"
  description = "Set scale to AZ type"
}

variable "os_type" {
  type    = string
  default = "Linux"
  description = "Set OS"
}