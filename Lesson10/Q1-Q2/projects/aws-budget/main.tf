provider "aws" {
  region = "us-east-1"
  version = "~> 2.58"
}

terraform {
  backend "s3" {
    bucket = "khalilj-terraform-states"
    key = "budget"
    region = "us-east-1"
    acl = "public-read"
  }
}

module "budget" {
  source = "../../modules/budget"
  budget-name = "budget-ec2-monthly"
  budget-type = "COST"
  budget-limit_amount = "1200"
  budget-limit_unit = "USD"
  budget-time_period_start = "2017-07-01_00:00"
  budget-time_period_end = "2087-06-15_00:00"
  budget-time_unit = "MONTHLY"
}
