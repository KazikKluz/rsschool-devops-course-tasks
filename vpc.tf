resource "aws_vpc" "rs_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "RS VPC"
  }
}
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.rs_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "RS Public A"
  }
}
resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.rs_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "RS Public B"
  }
}
resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.rs_vpc.id
  cidr_block = "10.0.100.0/24"
  tags = {
    Name = "RS Private A"
  }
}
resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.rs_vpc.id
  cidr_block = "10.0.101.0/24"
  tags = {
    Name = "RS Private B"
  }
}