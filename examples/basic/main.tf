# ==============================================================================
# Basic Example - Instana AWS Sensor ECS Module
# ==============================================================================
#
# This example demonstrates the minimal configuration required to deploy
# the Instana AWS Sensor on ECS Fargate.
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

  # Required: Network Configuration
  vpc_id  = var.vpc_id
  subnets = var.subnets

  # Required: Instana Configuration
  instana_agent_key = var.instana_agent_key
  instana_endpoint  = var.instana_endpoint

}