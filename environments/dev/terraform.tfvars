dev_rg = {
  "rg-dev" = {
    name     = "rg-todo-kubernetes"
    location = "australiaeast"
  }
}

dev_storage_account = {
  "storage-dev" = {
    name                     = "sttodokubernetes"
    resource_group_name      = "rg-todo-kubernetes"
    location                 = "australiaeast"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

dev_sql_server = {
  "sql-server-dev" = {
    name                          = "sqlserver-todo"
    resource_group_name           = "rg-todo-kubernetes"
    location                      = "australiaeast"
    administrator_login           = "adminuser"
    administrator_login_password  = "Pakistan1947"
    version                       = "12.0"
    minimum_tls_version           = "1.2"
    key_vault_name                = "kvtodo0007"
    key_vault_resource_group_name = "rg-todo-kubernetes"

  }
}



dev_sql_database = {
  "sql-db-dev" = {
    name                = "sqldb-todo"
    resource_group_name = "rg-todo-kubernetes"
    location            = "australiaeast"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "Basic"
    enclave_type        = "Default"
    sql_server_name     = "sqlserver-todo"
  }
}

dev_acr = {
  "acr-dev" = {
    acr_name            = "acrtodo"
    resource_group_name = "rg-todo-kubernetes"
    acr_location        = "australiaeast"
    acr_sku             = "Basic"
  }
}

dev_kv = {
  "kv-dev" = {
    name                       = "kvtodo0007"
    resource_group_name        = "rg-todo-kubernetes"
    location                   = "australiaeast"
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
  }
}

dev_kv_secret = {
  secret01 = {
    name = "umarfarooqtodo"
    # value                = "Pakistan1947*"
    resource_group_name = "rg-todo-kubernetes"
    key_vault_name      = "kvtodo0007"
  }
}

dev_akc = {
  "akc-dev" = {
    akc_name            = "akc-todo"
    location            = "australiaeast"
    resource_group_name = "rg-todo-kubernetes"
    dns_prefix          = "akctodoprefix"
    node_pool_name      = "default"
    node_count          = 2
    vm_size             = "Standard_DS2_v2"
  }
}