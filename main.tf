resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "network" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefix       = "10.1.0.0/24"
  virtual_network_name = azurerm_virtual_network.network.name
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name       = var.cluster_name
  location   = var.location
  dns_prefix = var.cluster_name

  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = var.kubernetes_version

  agent_pool_profile {
    name               = var.cluster_name
    count              = 4
    vm_size            = var.vm_size
    type               = var.type
    availability_zones = ["1", "2"]
    os_type            = var.os_type
    os_disk_size_gb    = 128
    vnet_subnet_id     = azurerm_subnet.subnet.id
  }

  service_principal {
    client_id     = "b2d48dea-e7e8-45dc-bacb-b2f58e4db279"
    client_secret = "djMrD/TctCMB=15Pbpzm4M=7Yz=u5PJ]"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }
}

