# ==============================================================================
# Input Variables
# ==============================================================================
#
# This file defines all input variables for the Instana AWS Sensor ECS module.
# Variables are organized into logical groups for better maintainability.
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Network Configuration
# ------------------------------------------------------------------------------
variable "vpc_id" {
  description = "The VPC ID to provision the ECS service"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ECS service deployment"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Assign a public IP address to the ECS task. Set to true for public subnets, false for private subnets (requires NAT Gateway)"
  type        = bool
  default     = false
}

# ------------------------------------------------------------------------------
# ECS Cluster Configuration
# ------------------------------------------------------------------------------
variable "create_ecs_cluster" {
  description = "Whether to create a new ECS cluster"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "ECS cluster name. If create_ecs_cluster is true, a new cluster will be created with this name; otherwise, the existing cluster with this name will be used."
  type        = string
  default     = "instana-agent-cluster"
}

# ------------------------------------------------------------------------------
# Security Group Configuration
# ------------------------------------------------------------------------------
variable "create_security_group" {
  description = "Whether to create a new security group"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "The security group ID for the ECS service (required if create_security_group is false)"
  type        = string
  default     = ""

  validation {
    condition     = var.create_security_group || var.security_group_id != ""
    error_message = "security_group_id must be provided when create_security_group is false."
  }
}

# ------------------------------------------------------------------------------
# Instana Sensor Configuration
# ------------------------------------------------------------------------------
variable "instana_agent_key" {
  description = "Instana agent key for authentication"
  type        = string
  sensitive   = true
}

variable "instana_download_key" {
  description = "Instana download key (usually same as agent key)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "instana_endpoint" {
  description = "Instana backend endpoint URL (e.g., ingress-pink-saas.instana.rocks, ingress-blue-saas.instana.io)"
  type        = string
}

variable "instana_endpoint_port" {
  description = "Instana backend endpoint port"
  type        = number
  default     = 443

  validation {
    condition     = var.instana_endpoint_port > 0 && var.instana_endpoint_port <= 65535
    error_message = "Port must be between 1 and 65535."
  }
}

# ------------------------------------------------------------------------------
# General Configuration
# ------------------------------------------------------------------------------
variable "region" {
  description = "AWS region for deployment (e.g., us-east-1, us-west-2, eu-west-1)"
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "instana-agent"
}

# ------------------------------------------------------------------------------
# Tagging Configuration
# ------------------------------------------------------------------------------

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "ecs_cluster_tags" {
  description = "Additional tags to apply to the ECS cluster"
  type        = map(string)
  default     = {}
}

variable "security_group_tags" {
  description = "Additional tags to apply to the security group"
  type        = map(string)
  default     = {}
}

variable "ecs_service_tags" {
  description = "Additional tags to apply to the ECS service"
  type        = map(string)
  default     = {}
}

variable "task_definition_tags" {
  description = "Additional tags to apply to the ECS task definition"
  type        = map(string)
  default     = {}
}

variable "iam_role_tags" {
  description = "Additional tags to apply to the IAM role"
  type        = map(string)
  default     = {}
}

variable "iam_policy_tags" {
  description = "Additional tags to apply to the IAM policy"
  type        = map(string)
  default     = {}
}