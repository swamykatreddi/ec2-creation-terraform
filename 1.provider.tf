terraform {
  required_version = " ~> 1.12.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
  backend "s3" {
    bucket       = "shivajichatrapathi143"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true

  }

}
# Provider Configuration
provider "aws" {
  # Configuration options
}
