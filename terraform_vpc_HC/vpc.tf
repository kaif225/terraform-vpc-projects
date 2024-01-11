# Create VPC terraform Module

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.0"

  # VPC Basic details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  # subnets for databse
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # TO ENABLE OR NOT NAT GATEWAY FOR THE PRIVATE SUBNETS.
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS PARAMETERS
  enable_dns_hostnames = true
  enable_dns_support   = true

  # TAGS
  public_subnet_tags = {
    Name = "public-subnet"
  }
  private_subnet_tags = {
    Name = "private-subnet"
  }
  database_subnet_tags = {
    Name = "database-subnet"
  }
  tags = {
    Owner       = "Kaif"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }
}



