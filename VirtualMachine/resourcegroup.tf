  resource "azurerm_resource_group" "myterraformgroup" {
    name     = "myTFrgGroup001"
    location = var.location

    tags = {
        environment = "Terraform Demo"
    }
}