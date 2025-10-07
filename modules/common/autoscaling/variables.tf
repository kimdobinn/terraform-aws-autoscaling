##################################
# Launch Template
##################################

variable "launch_template_id" {
  description = "Launch template ID to use for the Auto Scaling Group"
  type        = string
}

##################################
# Auto Scaling Group
##################################

variable "aws_autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "launch_template_version"{
  description = "Template version. Can be version number, $Latest, or $Default. (Default: $Default)"
  type = string
}

variable "availability_zones" {
  description = "List of availability zones for the Auto Scaling Group (optional, derived from subnets if not provided)"
  type        = list(string)
  default     = []
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs in which the Auto Scaling group should launch instances"
  type        = list(string)
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  type        = number
  default     = 300
}

variable "health_check_type" {
  description = "Health check type for the Auto Scaling Group (EC2 or ELB)"
  type        = string
  default     = "EC2"
}

variable "protect_from_scale_in" {
  description = "Whether instances in this Auto Scaling Group are protected from scale-in events"
  type        = bool
  default     = false
}

variable "default_cooldown" {
  description = "Default cooldown period (in seconds) for the Auto Scaling Group"
  type        = number
  default     = 300
}

variable "service_linked_role_arn" {
  description = "ARN of the service-linked role for Auto Scaling (optional)"
  type        = string
}

variable "capacity_reservation_preference" {
  description = "Capacity reservation preference for the Auto Scaling Group"
  type        = string
}

variable "capacity_distribution_strategy" {
  description = "The strategy to use for distributing capacity across the Availability Zones. Valid values are balanced-only and balanced-best-effort. Default is balanced-best-effort"
  type        = string
}

##################################
#Auto Scaling Policy
##################################

variable "scaling_policy_name" {
  description = "Name for the Auto Scaling policy"
  type        = string
  default     = null
}

variable "estimated_instance_warmup" {
  description = "Estimated time (in seconds) until a newly launched instance can contribute to CloudWatch metrics"
  type        = number
  default     = 300
}

variable "enabled" {
  description = "value"
  type = bool
}

variable "adjustment_type" {
  description = "Absolute number? Percentage of the current capacity? ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity."
  type = string
}

variable "target_value" {
  description = "Target CPU utilization percentage for the scaling policy"
  type        = number
}

variable "disable_scale_in" {
  description = "Whether to disable scale-in for the scaling policy"
  type        = bool
  default     = false
}

variable "predefined_metric_type" {
  description = "Predefined metric type for the scaling policy"
  type        = string
  default     = "ASGAverageCPUUtilization"
}