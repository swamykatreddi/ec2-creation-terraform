aws_region            = "us-east-1"
cidr_block            = "10.40.0.0/16"
environment           = "Dev"
vpc_name              = "vpc1"
newsubnets_cidr_block = ["10.30.40.0/24", "10.30.20.0/24", "10.30.30.0/24"]
public-subnet_cidr_block = [
  "10.40.3.0/24",
  "10.40.1.0/24",
  "10.40.2.0/24",
  "10.40.3.0/24",
  "10.40.2.0/24",
  "10.40.4.0/24",
"10.40.4.0/24"]
private-subnet_cidr_block = [
  "10.40.33.0/24",
  "10.40.11.0/24",
  "10.40.22.0/24",
"10.40.44.0/24"]
inbound_ports  = [21, 22, 80, 443, 8080]
outbound_ports = [21, 22, 80, 443, 8080]
azs = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]
machine_count = 3
imagename = {
  "us-east-1" = "ami-0f9de6e2d2f067fca",
  "us-east-2" = "ami-04f167a56786e4b09"
}

instance_type = "t2.micro"
key_name      = "ram_delete"