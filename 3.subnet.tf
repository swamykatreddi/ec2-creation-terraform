locals {
  public-subnet_cidr_block  = distinct(var.public-subnet_cidr_block)
  private-subnet_cidr_block = distinct(var.private-subnet_cidr_block)
}
# Public Subnet
resource "aws_subnet" "public-subnet" {
  #implicit dependency in vpc id
  count             = length(local.public-subnet_cidr_block)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(local.public-subnet_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name        = "${var.vpc_name}-public-subnet-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_subnet" "private-subnet" {
  #implicit dependency in vpc id
  count             = length(local.private-subnet_cidr_block)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(local.private-subnet_cidr_block, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index + 1}"
    Environment = var.environment
  }
}

