data "azurerm_key_vault" "ky_data" {

    for_each = var.sql_server
    name = each.value.key_vault_name
    resource_group_name = each.value.key_vault_resource_group_name
  
}

resource "random_password" "sql_server_password" {

    for_each = var.sql_server

    length           = 8
    special          = true
    override_special = "_%@*$&#"
  
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
    for_each = var.sql_server

    name         = "${each.value.name}-sql-admin-password"
    value        = random_password.sql_server_password[each.key].result
    key_vault_id = data.azurerm_key_vault.ky_data[each.key].id
    content_type = "password"
}

resource "azurerm_mssql_server" "sql_server" {

    for_each = var.sql_server

    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    version = each.value.version
    administrator_login = each.value.administrator_login
    administrator_login_password = random_password.sql_server_password[each.key].result

    minimum_tls_version = each.value.minimum_tls_version

}