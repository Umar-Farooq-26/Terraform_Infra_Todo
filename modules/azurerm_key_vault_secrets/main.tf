data "azurerm_key_vault" "kv_data" {
    for_each = var.kv_secret

    name = each.value.key_vault_name
    resource_group_name = each.value.resource_group_name
}

resource "random_password" "secret_value" {
    length           = 16
    special          = true
    override_special = "_%@*$&#"
  
}

resource "azurerm_key_vault_secret" "kv_secrets" {

    for_each = var.kv_secret
    name         = each.value.name
    value        = random_password.secret_value.result
    key_vault_id = data.azurerm_key_vault.kv_data[each.key].id

    tags = each.value.tags != null ? each.value.tags : {
        environment = "Terraform"
        project = "TodoApp"
        owner = "Terraform Team"
    }
}