locals {
  pvt_subnet_count = length(aws_subnet.private-subnet[*].id)

}
output "private_subnet_count" {
  value = local.pvt_subnet_count
}

resource "aws_eip" "nat_gateway_eip" {
  count  = local.pvt_subnet_count > 0 ? 1 : 0
  domain = "vpc"
}
resource "aws_nat_gateway" "nat_gateway" {
  count         = local.pvt_subnet_count > 0 ? 1 : 0
  allocation_id = aws_eip.nat_gateway_eip[0].id
  subnet_id     = aws_subnet.public-subnet[0].id

  tags = {
    Name        = "${var.vpc_name}-nat-gateway"
    Environment = var.environment
  }
}
resource "aws_route" "private" {
  count                  = local.pvt_subnet_count > 0 ? 1 : 0
  route_table_id         = aws_route_table.privatert.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway[0].id
}