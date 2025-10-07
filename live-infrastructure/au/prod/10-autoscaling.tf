module "autoscaling" {
  source = "../../../modules/common/autoscaling"

  # launch_template
  launch_template_id         = "lt-07a33a99f5b7e73f6"
  launch_template_version    = "$Default"

  # aws_autoscaling_group
  aws_autoscaling_group_name = "sgp-uat-backend-asg-TEST"
  availability_zones         = ["apse1-az1"]
  desired_capacity           = 0
  max_size                   = 0
  min_size                   = 0
  vpc_zone_identifier        = ["subnet-0fd653fca0875c57e"]

  health_check_grace_period  = 300
  health_check_type          = "EC2"

  protect_from_scale_in      = false

  default_cooldown           = 300

  service_linked_role_arn    = "" # what to put here

  capacity_reservation_preference = "default"

  capacity_distribution_strategy = "balanced-best-effort"
  
  # aws_autoscaling_policy
  scaling_policy_name        = "Target Tracking Policy"

  estimated_instance_warmup  = 0
  enabled                    = true
  adjustment_type            = "ChangeInCapacity"

  target_value               = 80.0
  disable_scale_in           = false

  predefined_metric_type     = "ASGAverageCPUUtilization"
}
