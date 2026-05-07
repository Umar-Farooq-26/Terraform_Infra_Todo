variable "kv_secret" {
    description = "A map of Key Vault secrets to create"
    type = map(object({
        name           = string
        # value          = string

        resource_group_name = string
        key_vault_name = string
    }))
  
}