variable "location" {
  type = string
  description = "resource location"
  default = "westus"
}


variable "admin_username" {
  type = string
  description = "server ssh user name"
  default = "azureuser"
}

variable "admin_password" {
  type = string
  description = "server ssh password"
  default = "Password1234!"
}