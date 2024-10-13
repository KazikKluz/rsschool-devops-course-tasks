resource "aws_internet_gateway" "rs_gw" {
  vpc_id = aws_vpc.rs_vpc.id

  tags = {
    Name = "RS IGW"
  }
}

resource "aws_internet_gateway_attachment" "rs_vpc_attach" {
  internet_gateway_id = aws_internet_gateway.rs_gw.id
  vpc_id              = aws_vpc.rs_vpc.id
}

