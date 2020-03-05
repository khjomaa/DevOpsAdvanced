provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dokuwiki" {
  ami = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  tags = {
    Name = "dokuwiki"
  }
  user_data = file("./init.sh")
  vpc_security_group_ids = [aws_security_group.servers-sg.id, data.aws_security_group.default-sg.id]
  depends_on = [aws_security_group.servers-sg]
}

output "public_dns" {
  value = aws_instance.dokuwiki.public_dns
}

output "public_ip" {
  value = aws_instance.dokuwiki.public_ip
}
