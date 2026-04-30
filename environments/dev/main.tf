
module "rg" {
  source = "../../modules/azurerm_resource_group"

  resource_group = var.dev_rg
}

module "storage_account" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_storage_account"

  my_storage_account = var.dev_storage_account
}

module "sql_server" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_sql_server"

  sql_server = var.dev_sql_server
}

module "sql_db" {
  depends_on = [ module.rg, module.sql_server ]
  source = "../../modules/azurerm_sql_database"

  sql_database = var.dev_sql_database
}

module "acr" {
  depends_on = [ module.rg, module.storage_account ]
  source = "../../modules/azurerm_azure_container_registry"

  acr = var.dev_acr
}

module "kv" {
  depends_on = [ module.rg, module.sql_server, module.sql_db ]
  source = "../../modules/azurerm_key_vault"

  kv = var.dev_kv
}

module "kv_secret" {
  depends_on = [ module.rg, module.kv ]
  source = "../../modules/azurerm_key_vault_secrets"

  kv_secret = var.dev_kv_secret
}

module "kubernetes_cluster" {
  depends_on = [ module.rg]
  source = "../../modules/azurerm_kubernetes_cluster"

  AKC = var.dev_akc
}