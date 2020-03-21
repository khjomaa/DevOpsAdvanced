resource "aws_autoscaling_policy" "asp" {
  name = "${var.project-name}-asp"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type = "StepScaling"
  adjustment_type = "ChangeInCapacity"
  step_adjustment {
    scaling_adjustment = 1
    metric_interval_lower_bound = 0.0
    metric_interval_upper_bound = null
  }
}