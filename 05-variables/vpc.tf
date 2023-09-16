resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_VIRGINIA"
    name = "Prueba"
    env = "Dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_OHIO"
    name = "Prueba"
    env = "Dev"
  }
}
