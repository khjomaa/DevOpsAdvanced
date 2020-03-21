data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "subnets" {
  vpc_id = data.aws_vpc.default_vpc.id
}

data "aws_security_group" "default-sg" {
  name = "default"
}

data "aws_availability_zones" "all" {}

variable "project-name" {}
variable "min-size" {}
variable "max-size" {}
variable "desired-capacity" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_instance_class" {}
variable "db_username" {}
variable "db_password" {}
variable "db_parameter_group_name" {}