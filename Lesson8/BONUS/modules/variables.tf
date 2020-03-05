variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AWS_AVAILABILITY_ZONE_1" {
  default = "us-east-1a"
}

variable "AWS_AVAILABILITY_ZONE_2" {
  default = "us-east-1b"
}

variable "VPC_CIDR" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

variable "SUBNET_A_CIDR" {
  description = "CIDR for the Subnet A"
  default = "10.0.0.0/24"
}

variable "SUBNET_B_CIDR" {
  description = "CIDR for the Subnet B"
  default = "10.0.1.0/24"
}

data "aws_subnet_ids" "my-subnets" {
  vpc_id = aws_vpc.my_vpc.id
}

data "aws_security_group" "default-sg" {
  name = "default"
}

data "template_file" "init" {
  template = file("${path.module}/init.sh")
}
