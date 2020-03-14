# terraform {
#   backend "remote" {
#     organization = "kepstein"

#     workspaces {
#       name = "cdw-testing"
#     }
#   }
# }

terraform {
  backend "s3" {
    bucket = "tf-stacks-states"
    key    = "sandbox-environment.tfstate"
    region = "us-east-1"
  }
}

# https://www.terraform.io/docs/providers/aws/d/availability_zones.html
data "aws_availability_zones" "available" {
  state = "available"
}

provider "aws" {
  region = var.deploy_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  private_subnets = var.public_subnet_cidrs
  public_subnets  = var.private_subnet_cidrs

  enable_dns_hostnames = var.dns_hostnames
  enable_dns_support   = var.dns_support

  enable_nat_gateway = var.nat_gateway
  enable_vpn_gateway = var.vpn_gateway

  tags = {
    Owner       = var.owner
    Terraform   = var.tf_version
    Environment = var.environment
  }
}