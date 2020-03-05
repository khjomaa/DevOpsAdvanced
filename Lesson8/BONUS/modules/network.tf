resource "aws_internet_gateway" "my-gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-gw"
  }
}

resource "aws_route_table" "public-crt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-gw.id
  }

  tags = {
    Name = "public-crt"
  }
}

resource "aws_route_table_association" "public-sunbet-a" {
  subnet_id = aws_subnet.subnet-a.id
  route_table_id = aws_route_table.public-crt.id
}

resource "aws_route_table_association" "public-sunbet-b" {
  subnet_id = aws_subnet.subnet-b.id
  route_table_id = aws_route_table.public-crt.id
}