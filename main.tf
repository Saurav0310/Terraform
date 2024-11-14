provider "aws" {
  region = var.region
}

# Call the VPC module
module "vpc" {
  source             = "./vpc"
  region             = var.region
  name               = var.name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr_1 = var.private_subnet_cidr_1
  private_subnet_cidr_2 = var.private_subnet_cidr_2
  public_subnet_az   = var.public_subnet_az
  private_subnet_az_1  = var.private_subnet_az_1
  private_subnet_az_2  = var.private_subnet_az_2
}

# Call the Compute module
module "compute" {
  source          = "./compute"
  region          = var.region
  name            = var.name
  vpc_id          = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ami_id          = var.ami_id
  instance_type   = var.instance_type
}

