variable "prefix" {
  default = ""

  validation {
    condition     = length(var.prefix) < 21
    error_message = "Your prefix is too long. Ensure that it doesn't exceed 20 characters in length."
  }
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "aws_vpc_cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "aws_availability_zones" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2c", "us-west-2b"]
}

variable "aws_vpc_public_cidr_blocks" {
  type    = list(string)
  default = ["192.168.0.0/19", "192.168.32.0/19", "192.168.64.0/19"]
}

variable "aws_vpc_private_cidr_blocks" {
  type    = list(string)
  default = ["192.168.96.0/19", "192.168.128.0/19", "192.168.160.0/19"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "single_nat_gateway" {
  type    = bool
  default = false
}

variable "one_nat_gateway_per_az" {
  type    = bool
  default = true
}

variable "ec2_instance_connect_sidr_block" {
  type = string
}
