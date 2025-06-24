# VPC Creation
resource "aws_vpc" "vpc1" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Environment = var.environment
  }
}

# internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name        = "${var.vpc_name}-igw"
    Environment = var.environment
  }
}



