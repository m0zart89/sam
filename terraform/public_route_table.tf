# Create Public Route Table
resource "aws_route_table" "public_subnet1_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway1.id
  }
}

# Create route table association of public subnet1
resource "aws_route_table_association" "public_subnet1_internet" {
  route_table_id = aws_route_table.public_subnet1_rt.id
  subnet_id      = aws_subnet.public_subnet1.id
}

# Create route table association of public subnet2
resource "aws_route_table_association" "public_subnet2_internet" {
  route_table_id = aws_route_table.public_subnet1_rt.id
  subnet_id      = aws_subnet.public_subnet2.id
}
