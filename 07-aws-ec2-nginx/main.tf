provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "nginx-server" {
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name

  vpc_security_group_ids = [
    aws_security_group.nginx-server-sg.id
  ]

  tags = {
    Name        = "nginx-server"
    Environment = "dev"
    Owner       = "lea.arturi@gmail.com"
    Team        = "LA"
    Project     = "POC"
  }
}

# ssh-keygen -t rsa -b 2048 -f "nginx-server.key"
resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "nginx-server-ssh"
  public_key = file("nginx-server.key.pub")

  tags = {
    Name        = "nginx-server-ssh"
    Environment = "dev"
    Owner       = "lea.arturi@gmail.com"
    Team        = "LA"
    Project     = "POC"
  }
}

resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
  description = "Security group allowing SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "nginx-server-sg"
    Environment = "dev"
    Owner       = "lea.arturi@gmail.com"
    Team        = "LA"
    Project     = "POC"
  }
}

output "server_public_ip" {
  description = "Direccion de IP publica de la instancia EC2"
  value       = aws_instance.nginx-server.public_ip
}

output "server_public_dns" {
  description = "DNS publico de la instancia EC2"
  value       = aws_instance.nginx-server.public_dns
}
