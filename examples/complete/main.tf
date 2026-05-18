# ==============================================================================
# Complete Example - Instana AWS Sensor ECS Module
# ==============================================================================
#
# This example demonstrates all available configuration options:
# - Option to use existing ECS cluster
# - Option to use existing security group
# - Public subnet deployment
#
# ==============================================================================

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "instana_sensor" {
  source = "../.."

  # Network Configuration
  vpc_id           = var.vpc_id
  subnets          = var.subnets
  assign_public_ip = var.assign_public_ip

  # ECS Cluster Configuration
  create_ecs_cluster = var.create_ecs_cluster
  cluster_name       = var.cluster_name

  # Security Group Configuration
  create_security_group = var.create_security_group
  security_group_id     = var.security_group_id

  # Instana Configuration
  instana_agent_key     = var.instana_agent_key
  instana_download_key  = var.instana_download_key
  instana_endpoint      = var.instana_endpoint
  instana_endpoint_port = var.instana_endpoint_port

  # General Configuration
  region      = var.region
  name_prefix = var.name_prefix

  # Tagging Configuration
  tags                 = var.tags
  ecs_cluster_tags     = var.ecs_cluster_tags
  security_group_tags  = var.security_group_tags
  ecs_service_tags     = var.ecs_service_tags
  task_definition_tags = var.task_definition_tags
  iam_role_tags        = var.iam_role_tags
  iam_policy_tags      = var.iam_policy_tags
}