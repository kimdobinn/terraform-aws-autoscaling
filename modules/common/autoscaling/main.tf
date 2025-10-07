# Auto Scaling Group Resource
resource "aws_autoscaling_group" "this" {
  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  name                = var.aws_autoscaling_group_name
  availability_zones  = var.availability_zones
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.vpc_zone_identifier

  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type

  protect_from_scale_in = var.protect_from_scale_in

  default_cooldown = var.default_cooldown

  service_linked_role_arn = var.service_linked_role_arn

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  availability_zone_distribution {
    capacity_distribution_strategy = var.capacity_distribution_strategy
  }
}

# Auto Scaling Policy Resource
resource "aws_autoscaling_policy" "this" {
  name                      = var.scaling_policy_name
  autoscaling_group_name    = aws_autoscaling_group.this.name
  estimated_instance_warmup = var.estimated_instance_warmup
  enabled                   = var.enabled
  adjustment_type           = var.adjustment_type

  target_tracking_configuration {
    target_value     = var.target_value
    disable_scale_in = var.disable_scale_in

    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }
  }
}