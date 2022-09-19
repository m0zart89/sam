# Create private route table for prv sub1
resource "aws_route_table" "private_subnet1_rt" {
  count  = "1"
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway1[count.index].id
  }
}

# Create route table association betn prv sub1 & NAT GW1
resource "aws_route_table_association" "private_subnet1_to_nat_gateway1" {
  count          = "1"
  route_table_id = aws_route_table.private_subnet1_rt[count.index].id
  subnet_id      = aws_subnet.private_subnet1.id
}

# Create private route table for prv sub2
resource "aws_route_table" "private_subnet2_rt" {
  count  = "1"
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway2[count.index].id
  }
}

# Create route table association betn prv sub2 & NAT GW2
resource "aws_route_table_association" "private_subnet2_to_nat_gateway1" {
  count          = "1"
  route_table_id = aws_route_table.private_subnet2_rt[count.index].id
  subnet_id      = aws_subnet.private_subnet2.id
}
