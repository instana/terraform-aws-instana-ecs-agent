# ==============================================================================
# Variables for Complete Example
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

variable "assign_public_ip" {
  description = "Assign a public IP address to the ECS task"
  type        = bool
  default     = false
}

variable "create_ecs_cluster" {
  description = "Whether to create a new ECS cluster"
  type        = bool
  default     = false
}

variable "cluster_name" {
  description = "ECS cluster name. If create_ecs_cluster is true, a new cluster will be created with this name; otherwise, the existing cluster with this name will be used."
  type        = string
}

variable "create_security_group" {
  description = "Whether to create a new security group"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "Existing security group ID (if not creating new)"
  type        = string
  default     = ""
}

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
  description = "Instana backend endpoint URL"
  type        = string
}

variable "instana_endpoint_port" {
  description = "Instana backend endpoint port"
  type        = number
  default     = 443
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
  description = "Additional tags for ECS cluster"
  type        = map(string)
  default     = {}
}

variable "security_group_tags" {
  description = "Additional tags for security group"
  type        = map(string)
  default     = {}
}

variable "ecs_service_tags" {
  description = "Additional tags for ECS service"
  type        = map(string)
  default     = {}
}

variable "task_definition_tags" {
  description = "Additional tags for task definition"
  type        = map(string)
  default     = {}
}

variable "iam_role_tags" {
  description = "Additional tags for IAM role"
  type        = map(string)
  default     = {}
}

variable "iam_policy_tags" {
  description = "Additional tags for IAM policy"
  type        = map(string)
  default     = {}
}