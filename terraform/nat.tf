# Create EIP for NAT GW1
resource "aws_eip" "nat_gateway1_eip" {
  count = "1"
}

# Create NAT gateway1
resource "aws_nat_gateway" "nat_gateway1" {
  count         = "1"
  allocation_id = aws_eip.nat_gateway1_eip[count.index].id
  subnet_id     = aws_subnet.public_subnet1.id
}

# Create EIP for NAT GW2
resource "aws_eip" "nat_gateway2_eip" {
  count = "1"
}

# Create NAT gateway2
resource "aws_nat_gateway" "nat_gateway2" {
  count         = "1"
  allocation_id = aws_eip.nat_gateway2_eip[count.index].id
  subnet_id     = aws_subnet.public_subnet2.id
}