variable "region" {
  description = "The AWS region"
  type        = string
}

variable "name" {
  description = "The name prefix for resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet"
  type        = string
}

variable "private_subnet_az_1" {
  description = "Availability Zone for the private subnet"
  type        = string
}

variable "private_subnet_az_2" {
  description = "Availability Zone for the private subnet"
  type        = string
}