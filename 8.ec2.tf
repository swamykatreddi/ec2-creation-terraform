
locals {
  environment = lower(var.environment)
}
resource "aws_vpc_security_group_vpc_association" "share-sg1" {
  vpc_id            = "vpc-090113d889463097a"
  security_group_id = aws_security_group.allow_all_traffic-sg1.id
}
resource "aws_instance" "webservers" {
  count         = local.environment == "dev" ? 3 : 1
  ami           = lookup(var.imagename, var.aws_region) # Replace with your desired AMI ID
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = element(aws_subnet.public-subnet[*].id, count.index)
  vpc_security_group_ids = [aws_security_group.allow_all_traffic-sg1.id,
  aws_security_group.sg2.id]
  associate_public_ip_address = true
  tags = {
    Name        = "${var.vpc_name}-webserver-${count.index + 1}"
    Environment = var.environment
    Version     = timestamp()
  }
  user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install -y nginx
        echo "<h1>Hello from terraform</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
        echo "<h1>${var.vpc_name} - WebServer-${count.index + 1}</h1>" | sudo tee -a /var/www/html/index.nginx-debian.html
       EOF
  # Add any additional user data commands here
  lifecycle {
    prevent_destroy = false
  }
  depends_on = [
  aws_vpc_security_group_vpc_association.share-sg1]
}
