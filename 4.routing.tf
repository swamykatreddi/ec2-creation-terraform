#routing table
resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "${var.vpc_name}-public-rt"
    Environment = var.environment
  }
}
resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name        = "${var.vpc_name}-private-rt"
    Environment = var.environment
  }
}
#route table association
resource "aws_route_table_association" "publicrtassociation" {
  count          = length(local.public-subnet_cidr_block)
  subnet_id      = element(aws_subnet.public-subnet[*].id, count.index)
  route_table_id = aws_route_table.publicrt.id
}
resource "aws_route_table_association" "privatertassociation" {
  count          = length(local.private-subnet_cidr_block)
  subnet_id      = element(aws_subnet.private-subnet[*].id, count.index)
  route_table_id = aws_route_table.privatert.id
}
