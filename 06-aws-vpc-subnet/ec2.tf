resource "aws_instance" "public_instance" {
  ami                     = "ami-04cb4ca688797756f"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

  provisioner "local-exec" {
    command = "echo Instancia creada con IP ${aws_instance.public_instance.public_ip} >> datos_instancia.txt"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo Instancia IP ${self.public_ip} destruida >> datos_instancia.txt"
  }
}

