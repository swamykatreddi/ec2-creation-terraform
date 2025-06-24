variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
}
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  #default     = "10.40.0.0/16"
}
variable "environment" {
  description = "The environment for the VPC"
  type        = string
  #default     = "Dev"
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  #default     = "vpc1"
}
variable "public-subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = list(string)
}
variable "private-subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = list(string)
}


variable "newsubnets_cidr_block" {
  description = "CIDR block for the newsubnets"
  type        = list(string)
  #default     = "10.40.3.0/24"
}
variable "azs" {
  description = "Availability zones for the new subnets"
  type        = list(string)
  #default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "machine_count" {
  description = "Number of machines to create"
  type        = number
}
variable "imagename" {
  description = "Name of the image to use"
  type        = map(any)
}
variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type must be one of: t2.micro, t2.small, t2.medium"
  }
}
variable "key_name" {
  description = "Name of the key pair to use"
  type        = string
}
variable "inbound_ports" {
  description = "List of inbound ports to allow"
  type        = list(number)
}
variable "outbound_ports" {
  description = "List of inbound ports to allow"
  type        = list(number)
}