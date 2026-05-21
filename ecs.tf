# ECS Cluster - conditionally create or use existing
resource "aws_ecs_cluster" "instana_sensor" {
  count = var.create_ecs_cluster ? 1 : 0
  name  = var.cluster_name

  tags = merge(
    var.tags,
    var.ecs_cluster_tags
  )
}

data "aws_ecs_cluster" "instana_sensor" {
  count        = var.create_ecs_cluster ? 0 : 1
  cluster_name = var.cluster_name
}

# Security Group - conditionally create or use existing
# This is an EC2/VPC Security Group (found in EC2 console -> Security Groups)
# Required AWS permissions: ec2:CreateSecurityGroup, ec2:AuthorizeSecurityGroupEgress
resource "aws_security_group" "instana_sensor" {
  count       = var.create_security_group ? 1 : 0
  name_prefix = "${var.name_prefix}-sg-"
  description = "Security group for Instana Sensor ECS Task"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic for Instana agent communication"
  }

  tags = merge(
    var.tags,
    var.security_group_tags
  )
}

data "aws_security_group" "instana_sensor" {
  count = var.create_security_group ? 0 : 1
  id    = var.security_group_id
}

# ECS Service for Instana Sensor
resource "aws_ecs_service" "instana_sensor" {
  name            = "${var.name_prefix}-service"
  task_definition = aws_ecs_task_definition.instana_sensor.arn
  cluster         = var.create_ecs_cluster ? one(aws_ecs_cluster.instana_sensor[*].id) : one(data.aws_ecs_cluster.instana_sensor[*].id)
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.create_security_group ? [one(aws_security_group.instana_sensor[*].id)] : [one(data.aws_security_group.instana_sensor[*].id)]
    assign_public_ip = var.assign_public_ip
  }

  tags = merge(
    var.tags,
    var.ecs_service_tags
  )
}