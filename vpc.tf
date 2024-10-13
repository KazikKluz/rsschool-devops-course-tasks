resource "aws_vpc" "rs_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "RS VPC"
  }
}