resource "aws_security_group" "rds-sg" {
  name   = "${var.project-name}-sg"
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group_rule" "ingress-all" {
  security_group_id = aws_security_group.rds-sg.id
  from_port         = 0
  to_port           = 0
  protocol          = -1
  type              = "ingress"
  self              = true
}

resource "aws_security_group_rule" "egress-all" {
  from_port         = 0
  protocol          = "TCP"
  security_group_id = aws_security_group.rds-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "port-8080-default-sg" {
  security_group_id = data.aws_security_group.default-sg.id
  from_port         = 8080
  to_port           = 8080
  protocol          = "TCP"
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}
