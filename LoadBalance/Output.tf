output "vm_ip1" {
  value =  azurerm_linux_virtual_machine.myterraformvm.public_ip_address
  #value = data.azurerm_public_ip.myterraformpublicip.ip_address
}

output "vm_ip2" {
  value =  azurerm_linux_virtual_machine.myterraformvm2.public_ip_address
  #value = data.azurerm_public_ip.myterraformpublicip.ip_address
}
