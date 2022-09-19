# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

# Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway1" {
  vpc_id = aws_vpc.main.id
}
