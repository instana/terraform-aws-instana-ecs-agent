# Complete Example

A more complete example showing configurable options such as existing resources and public or private subnet deployment.

## Usage

Copy `terraform.tfvars.example` to `terraform.tfvars`, update the values for your environment, and run Terraform from this directory.
This example is useful when you want to customize cluster, security group, and networking behavior.

## What This Example Creates

- **ECS Cluster**: Creates or uses the cluster identified by `cluster_name`
- **ECS Service**: Runs the Instana sensor task
- **ECS Task Definition**: Defines the Fargate task configuration
- **IAM Role**: Grants permissions required by the sensor
- **IAM Policy**: Defines the AWS permissions required by Instana
- **Security Group**: Creates or uses the security group for the task

## Configuration Highlights

- Existing or new ECS cluster
- Existing or new security group
- Public or private subnet deployment
- Configurable task count

## Outputs

All module outputs are available from this example configuration.
