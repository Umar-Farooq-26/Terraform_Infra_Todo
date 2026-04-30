resource "azurerm_resource_group" "RG" {
    for_each = var.resource_group

    name = each.value.name
    location = each.value.location

    tags = each.value.tags != null ? each.value.tags : {
        environment = "Terraform"
        project = "TodoApp"
        owner = "Terraform Team"
    }
}