resource "null_resource" copyfilengnix {
    provisioner "file" {  
        connection {
            type = "ssh"
            host = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
            #host = data.azurerm_public_ip.myterraformpublicip.ip_address
            user     = var.admin_username
            password = var.admin_password
            port = 22 
            timeout = "2m"
        }      
        source = "nginxrepo.sh"
        destination = "/tmp/nginxrepo.sh"     
    }
    provisioner "file" {  
        connection {
            type = "ssh"
            host = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
            #host = data.azurerm_public_ip.myterraformpublicip.ip_address
            user     = var.admin_username
            password = var.admin_password
            port = 22 
            timeout = "2m"
        }      
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
    }

    provisioner "remote-exec" { 
        connection {
            type = "ssh"
            host = azurerm_linux_virtual_machine.myterraformvm.public_ip_address
            #host = data.azurerm_public_ip.myterraformpublicip.ip_address
            user     = var.admin_username
            password = var.admin_password
            port = 22 
            timeout = "2m"
        } 
        inline = [
            "sudo chmod a+x /tmp/nginxrepo.sh",
            "sudo sh /tmp/nginxrepo.sh",
            "sudo chmod a+x /tmp/nginx.sh",
            "sudo sh /tmp/nginx.sh"
        ]
    }
}



resource "null_resource" copyfilengnix2 {
    provisioner "file" {  
        connection {
            type = "ssh"
            host = azurerm_linux_virtual_machine.myterraformvm2.public_ip_address
            #host = data.azurerm_public_ip.myterraformpublicip.ip_address
            user     = var.admin_username
            password = var.admin_password
            port = 22 
            timeout = "2m"
        }      
        source = "nginxrepo.sh"
        destination = "/tmp/nginxrepo.sh"     
    }
    provisioner "file" {  
        connection {
            type = "ssh"
            host = azurerm_linux_virtual_machine.myterraformvm2.public_ip_address
            #host = data.azurerm_public_ip.myterraformpublicip.ip_address
            user     = var.admin_username
            password = var.admin_password
            port = 22 
            timeout = "2m"
        }      
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
    }

    provisioner "remote-exec" { 
        connection {
            type = "ssh"
            host = azurerm_linux_virtual_machine.myterraformvm2.public_ip_address
            #host = data.azurerm_public_ip.myterraformpublicip.ip_address
            user     = var.admin_username
            password = var.admin_password
            port = 22 
            timeout = "2m"
        } 
        inline = [
            "sudo chmod a+x /tmp/nginxrepo.sh",
            "sudo sh /tmp/nginxrepo.sh",
            "sudo chmod a+x /tmp/nginx.sh",
            "sudo sh /tmp/nginx.sh"
        ]
    }
}