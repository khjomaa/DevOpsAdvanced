provider "aws" {
  region = "us-east-1"
  version = "~> 2.53"
}

provider "template" {
  version = "~> 2.1"
}

module "rds" {
  source = "../../modules/rds"
  max-size = 1
  min-size = 0
  desired-capacity = 1
  project-name = "bookstack"
  db_engine = "mysql"
  db_engine_version = "5.7"
  db_instance_class = "db.t2.micro"
  db_parameter_group_name = "default.mysql5.7"
  db_username = "bookstack"
  db_password = "secret123"
}

output "url" {
  value = module.rds.url
}