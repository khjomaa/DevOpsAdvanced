resource "aws_autoscaling_group" "asg" {
  max_size            = 1
  min_size            = 0
  desired_capacity    = 1
  # Reference the resources directly if you have the resources created
  # in the same project
  vpc_zone_identifier = [aws_subnet.subnet-a.id, aws_subnet.subnet-b.id]
  launch_template  {
    # Name and ID are conflicting, only one must be specified
    # https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html#launch_template-1
    id = aws_launch_template.dokuwiki.id
    version = "$Latest"
  }
}