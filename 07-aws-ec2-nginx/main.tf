####### tfstate #######
terraform {
  backend "s3" {
    bucket = "terraform-labs-larturi"
    key    = "terraform-labs-larturi/terraform.tfstate"
    region = "us-east-1"
  }
}

####### Provider #######
provider "aws" {
  region = "us-east-1"
}

####### Modulo Instancia EC2 con Nginx (Dev) #######
module "nginx_server_dev" {
  source = "./nginx_server_module"

  ami_id        = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  server_name   = "nginx-server-dev"
  environment   = "dev"
}

####### Modulo Instancia EC2 con Nginx (Test) #######
module "nginx_server_test" {
  source = "./nginx_server_module"

  ami_id        = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  server_name   = "nginx-server-test"
  environment   = "test"
}

####### Modulo Instancia EC2 con Nginx (Prod) #######
module "nginx_server_prod" {
  source = "./nginx_server_module"

  ami_id        = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  server_name   = "nginx-server-prod"
  environment   = "prod"
}

####### Outputs #######
output "nginx_public_ip_dev" {
  description = "Direccion de IP publica de la instancia EC2 (dev)"
  value       = module.nginx_server_dev.server_public_ip
}

output "nginx_public_dns_dev" {
  description = "DNS publico de la instancia EC2 (dev)"
  value       = module.nginx_server_dev.server_public_dns
}

output "nginx_public_ip_test" {
  description = "Direccion de IP publica de la instancia EC2 (test)"
  value       = module.nginx_server_test.server_public_ip
}

output "nginx_public_dns_test" {
  description = "DNS publico de la instancia EC2 (test)"
  value       = module.nginx_server_test.server_public_dns
}

output "nginx_public_ip_prod" {
  description = "Direccion de IP publica de la instancia EC2 (prod)"
  value       = module.nginx_server_prod.server_public_ip
}

output "nginx_public_dns_prod" {
  description = "DNS publico de la instancia EC2 (prod)"
  value       = module.nginx_server_prod.server_public_dns
}
