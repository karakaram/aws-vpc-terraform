module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = var.prefix
  cidr = var.aws_vpc_cidr_block

  azs = var.aws_availability_zones

  # Public segment of VPC hosts public load balancers, nomad clients (for SSH access),
  # NAT gateways for the private segment.
  public_subnets = var.aws_vpc_public_cidr_blocks

  # Private segment of VPC hosts internal load balancers, EKS pods and nodes.
  private_subnets = var.aws_vpc_private_cidr_blocks

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  # VPC Internal DNS is required for service discovery. DNS hostnames is needed
  # for this to work, but it is unclear why.
  enable_dns_hostnames = true
  enable_dns_support   = true

  # See https://docs.aws.amazon.com/eks/latest/userguide/load-balancing.html for
  # sub-net tagging details
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags = {
    Terraform = "true"
  }

  vpc_tags = {
    Name = "${var.prefix}-kubernetes"
  }
}
