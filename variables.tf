variable "vpc_name" {
  type    = string
  default = "Sandbox Environment"
}

variable "tf_version" {
  type    = string
  default = "v0.12.21"
}

variable "owner" {
  type    = string
  default = "Kevin Epstein"
}

variable "environment" {
  type    = string
  default = "developmemnt"
}

variable "deploy_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "dns_hostnames" {
  type    = bool
  default = true
}

variable "dns_support" {
  type    = bool
  default = true
}

variable "nat_gateway" {
  type    = bool
  default = false
}

variable "vpn_gateway" {
  type    = bool
  default = false
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
}