variable "sql_server" {
  
  type = map(object({

    name = string
    resource_group_name = string
    location = string
    version = string
    administrator_login = string

    minimum_tls_version = string

    key_vault_name = string
    key_vault_resource_group_name = string

    tags = optional(map(string))

  }))
}