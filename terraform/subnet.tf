# Create Public Subnet1
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub_sub1_cidr_block
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
}

# Create Public Subnet2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub_sub2_cidr_block
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
}

# Create Private Subnet1
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.prv_sub1_cidr_block
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = false
}

# Create Private Subnet2
resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.prv_sub2_cidr_block
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false
}
