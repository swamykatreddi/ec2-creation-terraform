provider "aws" {
  alias  = "ohio"
  region = "us-east-2"
}
resource "aws_vpc" "vpc1-ohio" {
  provider             = aws.ohio
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    Name        = var.vpc_name
    Environment = var.environment
  }
}

# internet gateway
resource "aws_internet_gateway" "igw-ohio" {
  provider = aws.ohio
  vpc_id   = aws_vpc.vpc1-ohio.id

  tags = {
    Name        = "${var.vpc_name}-igw-ohio"
    Environment = var.environment
  }
}

