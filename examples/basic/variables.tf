# ==============================================================================
# Variables for Basic Example
# ==============================================================================

variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID to provision the ECS service"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ECS service deployment"
  type        = list(string)
}

variable "instana_agent_key" {
  description = "Instana agent key for authentication"
  type        = string
  sensitive   = true
}

variable "instana_endpoint" {
  description = "Instana backend endpoint URL"
  type        = string
}