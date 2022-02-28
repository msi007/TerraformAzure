# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}


# Create public IP2
resource "azurerm_public_ip" "myterraformpublicip2" {
    name                         = "myPublicIP2"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Demo"
    }
}

# Create public LB IP  // sku shoube be Standard
resource "azurerm_public_ip" "LBip" {
    name                         = "LoadBip"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Static"
    sku                          = "Standard"
    availability_zone            = "No-Zone"

    tags = {
        environment = "Terraform Demo"
    }
}




# Create network interface 1
resource "azurerm_network_interface" "myterraformnic1" {
    name                      = "myNIC1"
    location                  = var.location
    resource_group_name       = azurerm_resource_group.myterraformgroup.name

    ip_configuration {
        name                          = "myNicConfiguration1"
        subnet_id                     = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
    }
    depends_on = [
    azurerm_subnet.myterraformsubnet
    ]

    tags = {
        environment = "Terraform Demo"
    }
}


# Create network interface 2
resource "azurerm_network_interface" "myterraformnic2" {
    name                      = "myNIC2"
    location                  = var.location
    resource_group_name       = azurerm_resource_group.myterraformgroup.name

    ip_configuration {
        name                          = "myNicConfiguration2"
        subnet_id                     = azurerm_subnet.myterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.myterraformpublicip2.id
    }
    depends_on = [
    azurerm_subnet.myterraformsubnet
    ]

    tags = {
        environment = "Terraform Demo"
    }
}


# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "nsgTonic" {
    network_interface_id      = azurerm_network_interface.myterraformnic1.id
    network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}


resource "azurerm_network_interface_security_group_association" "nsgTonic2" {
    network_interface_id      = azurerm_network_interface.myterraformnic2.id
    network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}