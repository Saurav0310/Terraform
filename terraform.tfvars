# terraform.tfvars (Root of your Terraform project)

# VPC and Subnet Configuration
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr_1 = "10.0.2.0/24"
private_subnet_cidr_2 = "10.0.3.0/24"
public_subnet_az    = "us-east-1a"
private_subnet_az_1   = "us-east-1a"
private_subnet_az_2   = "us-east-1b"
region              = "us-east-1"
name                = "myproject"

# Compute (EC2) Configuration
ami_id              = "ami-005fc0f236362e99f"
instance_type       = "t2.micro"

