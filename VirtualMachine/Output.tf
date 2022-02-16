output "vm_ip" {
  value =  azurerm_linux_virtual_machine.myterraformvm.public_ip_address
  #value = data.azurerm_public_ip.myterraformpublicip.ip_address
}
