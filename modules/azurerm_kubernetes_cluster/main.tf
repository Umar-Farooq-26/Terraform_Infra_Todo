resource "azurerm_kubernetes_cluster" "akc" {
  name                = each.value.akc_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name  = each.value.node_pool_name
    node_count = each.value.node_count
    vm_size    = each.value.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

    tags = each.value.tags != null ? each.value.tags : {
        environment = "Terraform"
        project     = "TodoApp"
        owner       = "Terraform Team"
    }
}