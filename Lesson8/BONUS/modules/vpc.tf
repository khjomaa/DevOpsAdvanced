resource "aws_vpc" "my_vpc" {
  cidr_block = var.VPC_CIDR
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = false
  instance_tenancy = "default"
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "subnet-a" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.SUBNET_A_CIDR
  map_public_ip_on_launch = true
  availability_zone = var.AWS_AVAILABILITY_ZONE_1
  tags = {
    Name = "Subnet A"
  }
}

resource "aws_subnet" "subnet-b" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.SUBNET_B_CIDR
  map_public_ip_on_launch = true
  availability_zone = var.AWS_AVAILABILITY_ZONE_2
  tags = {
    Name = "Subnet B"
  }
}