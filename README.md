# Instana AWS Sensor on ECS Fargate - Terraform Module

A Terraform module for deploying the Instana AWS Sensor on AWS ECS Fargate.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5 |
| aws | >= 5.0 |

## Prerequisites

Before running this module, ensure the user or IAM role executing Terraform has sufficient AWS permissions to create and manage:
- ECS clusters
- ECS services
- ECS task definitions
- IAM roles
- IAM policies
- Security groups

## Usage

Refer to the `examples` folder for usage examples and sample configurations.
It includes example Terraform configurations to help you get started with this module.

## Inputs

### Required Variables

This module requires the following variables to be provided explicitly:

| Name | Description | Type |
|------|-------------|------|
| region | AWS region for deployment | `string` |
| vpc_id | The VPC ID to provision the ECS service | `string` |
| subnets | List of subnet IDs for ECS service deployment | `list(string)` |
| instana_agent_key | Instana agent key for authentication | `string` (sensitive) |
| instana_endpoint | Instana backend endpoint URL | `string` |

### Optional Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| assign_public_ip | Assign a public IP address to the ECS task. Set to true for public subnets, false for private subnets (requires NAT Gateway) | `bool` | `false` |
| create_ecs_cluster | Whether to create a new ECS cluster | `bool` | `true` |
| cluster_name | ECS cluster name. If create_ecs_cluster is true, a new cluster will be created with this name; otherwise, the existing cluster with this name will be used. | `string` | `"instana-agent-cluster"` |
| create_security_group | Whether to create a new security group | `bool` | `true` |
| security_group_id | The security group ID for the ECS service (required if create_security_group is false) | `string` | `""` |
| instana_download_key | Instana download key (usually same as agent key) | `string` | `""` |
| instana_endpoint_port | Instana backend endpoint port | `number` | `443` |
| name_prefix | Prefix for resource names | `string` | `"instana-agent"` |
| tags | Common tags to apply to all resources | `map(string)` | `{}` |
| ecs_cluster_tags | Additional tags to apply to the ECS cluster | `map(string)` | `{}` |
| security_group_tags | Additional tags to apply to the security group | `map(string)` | `{}` |
| ecs_service_tags | Additional tags to apply to the ECS service | `map(string)` | `{}` |
| task_definition_tags | Additional tags to apply to the ECS task definition | `map(string)` | `{}` |
| iam_role_tags | Additional tags to apply to the IAM role | `map(string)` | `{}` |
| iam_policy_tags | Additional tags to apply to the IAM policy | `map(string)` | `{}` |

## Outputs

| Name | Description |
|------|-------------|
| ecs_cluster_id | The ID of the ECS Cluster where the Instana Sensor is deployed |
| ecs_cluster_name | The name of the ECS Cluster where the Instana Sensor is deployed |
| ecs_service_name | The name of the ECS Service for the Instana Sensor |
| ecs_service_id | The ID of the ECS Service for the Instana Sensor |
| task_definition_arn | The ARN of the Instana Sensor task definition |
| task_definition_family | The family of the Instana Sensor task definition |
| iam_role_arn | The ARN of the IAM role used by the Instana Sensor |
| iam_role_name | The name of the IAM role used by the Instana Sensor |
| security_group_id | The ID of the security group used by the Instana Sensor |

## Resources Created

This module creates the following AWS resources:

- **ECS Cluster** (optional): Hosts the Instana sensor service
- **ECS Service**: Runs and maintains the Instana sensor tasks
- **ECS Task Definition**: Defines the Fargate task configuration for the sensor
- **IAM Role**: Grants permissions required by the sensor task
- **IAM Policy**: Defines the AWS permissions required by Instana
- **Security Group** (optional): Controls network access for the ECS tasks