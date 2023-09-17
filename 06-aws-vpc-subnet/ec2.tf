resource "aws_instance" "public_instance" {
  ami                     = "ami-04cb4ca688797756f"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
}