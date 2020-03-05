resource "aws_security_group" "servers-sg" {
  name = "dokuwiki-sg"
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group_rule" "ingress-all" {
  security_group_id = aws_security_group.servers-sg.id
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}