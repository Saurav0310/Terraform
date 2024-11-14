provider "aws" {
  region = var.region
}

# Security Group to allow SSH access
resource "aws_security_group" "allow_ssh" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-allow-ssh"
  }
}

# EC2 Instance in Public Subnet
resource "aws_instance" "ubuntu_instance" {
  ami                    = var.ami_id  # Specify the Ubuntu AMI ID for your region
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]  # Use security group ID here

  tags = {
    Name = "${var.name}-public-ec2"
  }
}
