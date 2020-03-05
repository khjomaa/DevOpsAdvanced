provider "aws" {
  region = var.AWS_REGION
  version = "~> 2.51"
}

provider "template" {
  version = "~> 2.1"
}

resource "aws_launch_template" "dokuwiki" {
  name = "dokuwiki-lt"

  image_id = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    aws_security_group.servers-sg.id,
    data.aws_security_group.default-sg.id
  ]
  user_data = base64encode(data.template_file.init.rendered)
  depends_on = [aws_security_group.servers-sg]

  tags = {
    Name = "dokuwiki"
  }
}
