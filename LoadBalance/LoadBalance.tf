resource "azurerm_lb" "loadbalance1" {
  name                = "load1"
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  location            = var.location
  sku                 = "Standard"


 frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.LBip.id
  }
  depends_on = [
     azurerm_public_ip.LBip 
  ]
}


resource "azurerm_lb_backend_address_pool" "bkpool1" {
  loadbalancer_id = azurerm_lb.loadbalance1.id
  name            = "BackEndAddressPool"
  depends_on = [
      azurerm_lb.loadbalance1
  ]
}


resource "azurerm_lb_backend_address_pool_address" "polladdress1" {
  name                    = "polladdress1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bkpool1.id
  virtual_network_id      = azurerm_virtual_network.myterraformnetwork.id
  ip_address              = azurerm_network_interface.myterraformnic1.private_ip_address
  depends_on =[
      azurerm_lb_backend_address_pool.bkpool1
    ]
}

resource "azurerm_lb_backend_address_pool_address" "polladdress2" {
  name                    = "polladdress2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bkpool1.id
  virtual_network_id      = azurerm_virtual_network.myterraformnetwork.id
  ip_address              = azurerm_network_interface.myterraformnic2.private_ip_address
  depends_on =[
      azurerm_lb_backend_address_pool.bkpool1
    ]
}


resource "azurerm_lb_probe" "HprobeA" {
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  loadbalancer_id     = azurerm_lb.loadbalance1.id
  name                = "HprobeA"
  port                = 80
  depends_on =[
      azurerm_lb.loadbalance1
  ]
}



resource "azurerm_lb_rule" "RuleA" {
  resource_group_name            = azurerm_resource_group.myterraformgroup.name
  loadbalancer_id                = azurerm_lb.loadbalance1.id
  name                           = "RuleA"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontend-ip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bkpool1.id]
  probe_id                       = azurerm_lb_probe.HprobeA.id
  depends_on  = [
      azurerm_lb.loadbalance1,
      azurerm_lb_probe.HprobeA   
  ]
}