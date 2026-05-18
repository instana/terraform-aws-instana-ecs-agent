# ==============================================================================
# Instana AWS Sensor ECS Terraform Module
# ==============================================================================
#
# This Terraform module deploys the Instana AWS Sensor on ECS Fargate for
# comprehensive AWS infrastructure and service monitoring.
#
# Module Structure:
# ----------------
# - main.tf              : This file - module overview and documentation
# - ecs.tf               : ECS cluster, service, and security group
# - task_definition.tf   : ECS task definition for Instana sensor
# - iam.tf               : IAM roles and policies
# - outputs.tf           : Module output values
# - variables.tf         : Input variable definitions with validation
# - provider.tf          : AWS provider configuration
# - versions.tf          : Terraform and provider version constraints
# - templates/           : Configuration templates (container definition, IAM)
#
# Usage:
# ------
# This module can be used directly or called from another Terraform configuration.
# See README.md for detailed usage examples and configuration options.
#
# Key Features:
# ------------
# - Official Instana AWS Sensor configuration
# - Flexible ECS cluster management (create new or use existing)
# - Flexible security group management (create new or use existing)
# - Monitors 30+ AWS services automatically
# - Template-based configuration for easy updates
# - Comprehensive IAM permissions for AWS service discovery
# - CloudWatch logging integration
#
# Resources Created:
# -----------------
# - aws_ecs_cluster             : ECS cluster (optional)
# - aws_ecs_service             : ECS service for Instana sensor
# - aws_ecs_task_definition     : Task definition with sensor container
# - aws_security_group          : Security group (optional)
# - aws_iam_role                : Task execution and task roles
# - aws_iam_role_policy_attachment : Attaches policies to roles
#
# For more information, see:
# - README.md for usage documentation
# - CHANGELOG.md for version history
#
# ==============================================================================