variable "AKC" {
    description = "Azure Kubernetes Cluster configuration"
    type = object({
        akc_name                = string
        location            = string
        resource_group_name = string
        dns_prefix          = string
        node_pool_name      = string
        node_count          = number
        vm_size             = string
        tags                = map(string)
    })
  
}