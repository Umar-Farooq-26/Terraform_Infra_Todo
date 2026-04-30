resource "azurerm_storage_account" "my_storage_account" {
    for_each = var.my_storage_account

    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    account_tier = each.value.account_tier
    account_replication_type = each.value.account_replication_type

    tags = each.value.tags != null ? each.value.tags : {
        environment = "Terraform"
        project = "TodoApp"
        owner = "Terraform Team"
    }
  
}