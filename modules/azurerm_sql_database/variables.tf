variable "sql_database" {
    description = "A map of SQL databases to create."
    type        = map(object({
        name         = string   
        collation    = string
        license_type = string
        max_size_gb  = number
        sku_name     = string
        enclave_type = string

        resource_group_name = string
        sql_server_name    = string
        
        tags = optional(map(string))

    })) 
  
}