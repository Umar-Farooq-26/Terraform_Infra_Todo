data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "umarkv" {

    for_each = var.kv

    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    sku_name = each.value.sku_name
    soft_delete_retention_days = each.value.soft_delete_retention_days
    purge_protection_enabled = each.value.purge_protection_enabled

    tenant_id = data.azurerm_client_config.current.tenant_id


  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Import",
      "Update",
      "GetRotationPolicy",
      "SetRotationPolicy",
      "Rotate",
    ]
        secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
    ]

    certificate_permissions = [
      "Get",
      "List",
      "Create",
      "Delete",
      "Update",
      "Import",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers"
    ]
  }
}