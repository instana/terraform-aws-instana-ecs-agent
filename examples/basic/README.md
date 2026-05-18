# Basic Example

A minimal example for deploying the Instana AWS Sensor on ECS Fargate.

## Usage

Copy `terraform.tfvars.example` to `terraform.tfvars`, update the values for your environment, and run Terraform from this directory.
This example is intended for a simple deployment using a new ECS cluster and security group.

## What This Example Creates

- **ECS Cluster**: Creates a new ECS cluster
- **ECS Service**: Runs the Instana sensor task
- **ECS Task Definition**: Defines the Fargate task configuration
- **IAM Role**: Grants permissions required by the sensor
- **IAM Policy**: Defines the AWS permissions required by Instana
- **Security Group**: Allows outbound access for the task

## Outputs

- `ecs_cluster_id`
- `ecs_service_name`
- `task_definition_arn`

## Clean Up

```bash
terraform destroy