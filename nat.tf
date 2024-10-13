resource "aws_nat_gateway" "rs_nat" {
  allocation_id = aws_eip.rs_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "RS NAT"
  }

  depends_on = [aws_internet_gateway.rs_gw]
}

resource "aws_eip" "rs_eip" {
  domain = "vpc"
}