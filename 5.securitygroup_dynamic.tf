locals {
  inbound_ports  = toset(var.inbound_ports)
  outbound_ports = toset(var.outbound_ports)
}
resource "aws_security_group" "sg2" {
  name        = "${var.vpc_name}-sg2"
  description = "Security group to allow all inbound and outbound traffic"
  vpc_id      = aws_vpc.vpc1.id # Replace with your VPC ID

  tags = {
    Name        = "${var.vpc_name}-sg2"
    Environment = var.environment
  }

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}