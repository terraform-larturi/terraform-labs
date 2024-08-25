# AWS EC2 con Terraform

## Para entrar por ssh

```bash
ssh ec2-user@34.201.242.39
```

## Comandos

```bash
terraform init 

terraform plan

terraform apply

terraform destroy

terraform outputs
```

## Crear las keys para cada ambiente y guardarlas en la raiz

```bash
ssh-keygen -t rsa -b 2048 -f "nginx-server-<environment>.key"
```
