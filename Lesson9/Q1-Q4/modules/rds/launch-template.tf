data "template_file" "init" {
  template = file("${path.module}/init.sh")
  vars = {
    db_host = aws_db_instance.default.address
    db_database = var.project-name
    db_username = var.db_username
    db_password = var.db_password
  }
}

resource "aws_launch_template" "lt" {
  name = "${var.project-name}-lt"

  image_id = "ami-0b898040803850657"
  instance_type = "t2.micro"
  key_name = "DevOps"
  vpc_security_group_ids = [
    aws_security_group.rds-sg.id,
    data.aws_security_group.default-sg.id
  ]
  user_data = base64encode(data.template_file.init.rendered)
  depends_on = [aws_security_group.rds-sg, aws_db_instance.default]
}