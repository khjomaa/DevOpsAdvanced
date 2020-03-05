resource "aws_autoscaling_group" "asg" {
  max_size            = 1
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = data.aws_subnet_ids.subnets.ids
  launch_template {
    name = aws_launch_template.dokuwiki.name
  }
}