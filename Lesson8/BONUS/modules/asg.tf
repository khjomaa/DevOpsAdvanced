resource "aws_autoscaling_group" "asg" {
  max_size            = 1
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = data.aws_subnet_ids.my-subnets.ids
  launch_template {
    id = aws_launch_template.dokuwiki.id
    name = aws_launch_template.dokuwiki.name
    version = "$Latest"
  }
}