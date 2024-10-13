resource "aws_vpc" "RS_VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "RS VPC"
  }
}

resource "aws_subnet" "Public_A" {
  vpc_id     = aws_vpc.RS_VPC.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "RS Public A"
  }
}

resource "aws_subnet" "Public_B" {
  vpc_id     = aws_vpc.RS_VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "RS Public B"
  }
}

resource "aws_subnet" "Private_A" {
  vpc_id     = aws_vpc.RS_VPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "RS Private A"
  }
}

resource "aws_subnet" "Private_B" {
  vpc_id     = aws_vpc.RS_VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "RS Private B"
  }
}