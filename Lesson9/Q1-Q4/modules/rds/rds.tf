resource "aws_db_instance" "default" {
  identifier             = var.project-name
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  name                   = var.project-name
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = var.db_parameter_group_name
  db_subnet_group_name   = aws_db_subnet_group.dsg.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id, data.aws_security_group.default-sg.id]
  skip_final_snapshot    = true
}
