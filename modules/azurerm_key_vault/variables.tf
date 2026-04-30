variable "kv" {
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        sku_name            = string
        soft_delete_retention_days = number
        purge_protection_enabled   = bool

        tags = optional(map(string))

    }))
  
}