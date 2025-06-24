output "vpc1_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc1.id
}

output "public-subnet_id" {
  description = "The IDs of the subnets"
  value       = aws_subnet.public-subnet[*].id
}
output "private-subnet_id" {
  description = "The IDs of the subnets"
  value       = aws_subnet.private-subnet[*].id
}
output "allow_all_traffic-sg1_id" {
  description = "The IDs of the security groups"
  value       = aws_security_group.allow_all_traffic-sg1.id
}
