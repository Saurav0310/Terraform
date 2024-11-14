variable "region" {
  description = "The AWS region"
  type        = string
}

variable "name" {
  description = "The name prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the EC2 instance will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the EC2 instance will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where the EKS cluster and node group will be deployed"
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID for the Ubuntu instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}


