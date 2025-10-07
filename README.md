# AWS Auto Scaling Terraform Module

## Overview

During my internship as a Cloud Software Engineer, I was tasked with automating AWS Auto Scaling Group (ASG) provisioning using Terraform. Previously, auto scaling resources were created manually through the AWS Console, which was time-consuming and prone to human error. This project converts that manual process into reusable, version-controlled Infrastructure as Code.

## Problem Statement

The company's existing Terraform setup lacked automated provisioning for AWS Auto Scaling Groups. Auto scaling configurations were created manually via the AWS Web UI, leading to:
- Inconsistent configurations across environments
- Lack of version control for scaling policies
- Difficult reproducibility and disaster recovery
- Manual effort required for each new ASG deployment

## Solution

I reverse-engineered the manually-created Auto Scaling Group and developed a reusable Terraform module that automates the provisioning of:
- AWS Auto Scaling Groups with configurable capacity settings
- Target Tracking Scaling Policies for automatic scaling based on metrics
- Proper dependency management between resources
- Flexible configuration options for different use cases

## Technical Implementation

### Module Structure

```
modules/common/autoscaling/
├── main.tf           # Core ASG and scaling policy resources
├── variables.tf      # Input variable definitions
└── outputs.tf        # Module outputs

10-autoscaling.tf     # Module usage example
```

### Key Components

**Auto Scaling Group (`aws_autoscaling_group`)**
- Launch template integration with version control
- Configurable capacity settings (min/max/desired)
- Multi-AZ distribution with custom strategies
- Health check configuration
- Capacity reservation support
- Scale-in protection options

**Scaling Policy (`aws_autoscaling_policy`)**
- Target tracking configuration
- Predefined metric specifications (CPU, Network, etc.)
- Customizable target values and warmup periods
- Scale-in controls

### Configuration Options

The module accepts 20+ configurable parameters including:
- Launch template settings
- Capacity and scaling thresholds
- Availability zone distribution strategies
- Health check parameters
- Cooldown periods
- Target tracking metrics and values

## Skills Demonstrated

- **Infrastructure as Code (IaC)**: Terraform module development and resource management
- **AWS Services**: Auto Scaling Groups, EC2 Launch Templates, CloudWatch metrics
- **Reverse Engineering**: Analyzing manually-created infrastructure to replicate in code
- **Software Engineering**: Modular design, parameterization, and reusability
- **Cloud Architecture**: Understanding of auto scaling patterns and best practices
- **DevOps Practices**: Automation, version control, and infrastructure standardization

## Usage Example

```hcl
module "autoscaling" {
  source = "../../../modules/common/autoscaling"

  # Launch Template
  launch_template_id      = "lt-xxxxxxxxxxxxx"
  launch_template_version = "$Default"

  # Auto Scaling Group Configuration
  aws_autoscaling_group_name = "my-application-asg"
  desired_capacity           = 2
  max_size                   = 10
  min_size                   = 1
  vpc_zone_identifier        = ["subnet-xxxxx", "subnet-yyyyy"]

  # Scaling Policy
  scaling_policy_name = "Target Tracking Policy"
  target_value        = 80.0  # Target 80% CPU utilization
  adjustment_type     = "ChangeInCapacity"
}
```

## Impact

This module enables:
- **Automation**: One-command deployment of complete auto scaling infrastructure
- **Consistency**: Standardized configurations across all environments
- **Version Control**: Full audit trail of infrastructure changes
- **Reusability**: Easy deployment of ASGs for multiple applications
- **Reduced Manual Effort**: Eliminates manual AWS Console configuration

## Technical Environment

- **Tool**: Terraform
- **Cloud Provider**: AWS (Amazon Web Services)
- **Resources**: EC2 Auto Scaling Groups, Auto Scaling Policies
- **Configuration**: HCL (HashiCorp Configuration Language)

---

*This project was developed during my internship to modernize infrastructure provisioning and bring auto scaling capabilities into the company's Terraform codebase.*
