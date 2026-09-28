#Terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.28.0"
    }
  }
}

#provider block
provider "aws" {
  region = "ap-south-1"
}
