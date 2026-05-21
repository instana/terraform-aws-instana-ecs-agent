# ECS Task Definition for Instana Sensor
# Using templatefile to reference task_definition.json configuration
resource "aws_ecs_task_definition" "instana_sensor" {
  family                   = var.name_prefix
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = "2048"
  memory = "4096"

  execution_role_arn = aws_iam_role.instana_sensor.arn
  task_role_arn      = aws_iam_role.instana_sensor.arn

  container_definitions = templatefile("${path.module}/templates/container_definition.json.tftpl", {
    instana_agent_key           = var.instana_agent_key
    instana_download_key        = var.instana_download_key != "" ? var.instana_download_key : var.instana_agent_key
    instana_agent_endpoint      = var.instana_endpoint
    instana_agent_endpoint_port = var.instana_endpoint_port
  })

  tags = merge(
    var.tags,
    var.task_definition_tags
  )
}