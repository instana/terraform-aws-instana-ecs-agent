# ==============================================================================
# Output Values
# ==============================================================================
#
# This file defines all output values from the Instana AWS Sensor ECS module.
# Outputs are organized by resource type for easy reference.
#
# ==============================================================================

# ------------------------------------------------------------------------------
# ECS Cluster Outputs
# ------------------------------------------------------------------------------

output "ecs_cluster_id" {
  description = "The ID of the ECS Cluster where the Instana Sensor is deployed"
  value       = var.create_ecs_cluster ? one(aws_ecs_cluster.instana_sensor[*].id) : one(data.aws_ecs_cluster.instana_sensor[*].id)
}

output "ecs_cluster_name" {
  description = "The name of the ECS Cluster where the Instana Sensor is deployed"
  value       = var.cluster_name
}

# ------------------------------------------------------------------------------
# ECS Service Outputs
# ------------------------------------------------------------------------------

output "ecs_service_name" {
  description = "The name of the ECS Service for the Instana Sensor"
  value       = aws_ecs_service.instana_sensor.name
}

output "ecs_service_id" {
  description = "The ID of the ECS Service for the Instana Sensor"
  value       = aws_ecs_service.instana_sensor.id
}

# ------------------------------------------------------------------------------
# Task Definition Outputs
# ------------------------------------------------------------------------------

output "task_definition_arn" {
  description = "The ARN of the Instana Sensor task definition"
  value       = aws_ecs_task_definition.instana_sensor.arn
}

output "task_definition_family" {
  description = "The family of the Instana Sensor task definition"
  value       = aws_ecs_task_definition.instana_sensor.family
}

# ------------------------------------------------------------------------------
# IAM Outputs
# ------------------------------------------------------------------------------

output "iam_role_arn" {
  description = "The ARN of the IAM role used by the Instana Sensor"
  value       = aws_iam_role.instana_sensor.arn
}

output "iam_role_name" {
  description = "The name of the IAM role used by the Instana Sensor"
  value       = aws_iam_role.instana_sensor.name
}

# ------------------------------------------------------------------------------
# Security Group Outputs
# ------------------------------------------------------------------------------

output "security_group_id" {
  description = "The ID of the security group used by the Instana Sensor"
  value       = var.create_security_group ? one(aws_security_group.instana_sensor[*].id) : var.security_group_id
}
