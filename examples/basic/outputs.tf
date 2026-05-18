# ==============================================================================
# Outputs for Basic Example
# ==============================================================================

output "ecs_cluster_id" {
  description = "The ID of the ECS Cluster"
  value       = module.instana_sensor.ecs_cluster_id
}

output "ecs_service_name" {
  description = "The name of the ECS Service"
  value       = module.instana_sensor.ecs_service_name
}

output "task_definition_arn" {
  description = "The ARN of the task definition"
  value       = module.instana_sensor.task_definition_arn
}