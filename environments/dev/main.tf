variable "dev_rg" {}
variable "dev_storage_account" {}
variable "dev_sql_server" {}
variable "dev_sql_database" {}
variable "dev_acr" {}
variable "dev_kv" {}
variable "dev_kv_secret" {}
variable "dev_akc" {}


module "rg" {
    source = "../../modules/azure_resource_group"

    resource_group = var.dev_rg
}

module "storage_account" {
    source = "../../modules/azurerm_storage_account"

    my_storage_account = var.dev_storage_account
}

module "sql_server" {
    source = "../../modules/azurerm_sql_server"

    sql_server = var.dev_sql_server
}

module "sql_db" {
    source = "../../modules/azurerm_sql_database"

    sql_database = var.dev_sql_database
} 

module "acr" {
    source = "../../modules/azurerm_container_registry"

    acr = var.dev_acr
}

module "kv" {
    source = "../../modules/azurerm_key_vault"

    kv = var.dev_kv
}

module "kv_secret" {
    source = "../../modules/azurerm_key_vault_secret"

    kv_secret = var.dev_kv_secret
}

module "kubernetes_cluster" {
    source = "../../modules/azurerm_kubernetes_cluster"

    AKC = var.dev_akc  
}