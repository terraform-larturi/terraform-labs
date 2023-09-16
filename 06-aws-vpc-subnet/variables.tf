variable "virginia_cidr" {
    description = "CIDR Virginia"
    type = string
    sensitive = false 
    # En true trata a la variable como sensible y la oculta en el plan y en el deploy
}

variable "public_subnet" {
    description = "CIDR Public Subnet"
    type = string
}

variable "private_subnet" {
    description = "CIDR Private Subnet"
    type = string
}

variable "tags" {
  description = "Tags del proyecto"
  type = map(string)
}