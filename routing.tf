resource "aws_route_table" "rs_public_rt" {
  vpc_id = aws_vpc.rs_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rs_gw.id
  }


  tags = {
    Name = "RS Public Route Table"
  }
}

resource "aws_route_table" "rs_private_rt" {
  vpc_id = aws_vpc.rs_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.rs_nat.id
  }


  tags = {
    Name = "RS Private Route Table"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.rs_public_rt.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.rs_public_rt.id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.rs_private_rt.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.rs_private_rt.id
}