# ==============================================================================
# Outputs for Complete Example
# ==============================================================================

output "ecs_cluster_id" {
  description = "The ID of the ECS Cluster"
  value       = module.instana_sensor.ecs_cluster_id
}

output "ecs_cluster_name" {
  description = "The name of the ECS Cluster"
  value       = module.instana_sensor.ecs_cluster_name
}

output "ecs_service_name" {
  description = "The name of the ECS Service"
  value       = module.instana_sensor.ecs_service_name
}

output "ecs_service_id" {
  description = "The ID of the ECS Service"
  value       = module.instana_sensor.ecs_service_id
}

output "task_definition_arn" {
  description = "The ARN of the task definition"
  value       = module.instana_sensor.task_definition_arn
}

output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.instana_sensor.iam_role_arn
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.instana_sensor.security_group_id
}
