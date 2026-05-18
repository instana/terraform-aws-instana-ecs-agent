# IAM Assume Role Policy for ECS Tasks
data "aws_iam_policy_document" "instana_sensor_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# IAM Role for Instana Sensor (used for both execution and task role)
resource "aws_iam_role" "instana_sensor" {
  name_prefix        = "${var.name_prefix}-"
  assume_role_policy = data.aws_iam_policy_document.instana_sensor_assume_role.json

  tags = merge(
    var.tags,
    var.iam_role_tags
  )
}

# IAM Policy for Instana monitoring permissions
resource "aws_iam_policy" "instana_monitoring" {
  name_prefix = "${var.name_prefix}-monitoring-"
  description = "Policy for Instana Sensor to discover and monitor AWS resources"
  policy      = file("${path.module}/templates/IAMpermissions.json.tftpl")

  tags = merge(
    var.tags,
    var.iam_policy_tags
  )
}

# Attach Instana monitoring policy to role
resource "aws_iam_role_policy_attachment" "instana_monitoring" {
  role       = aws_iam_role.instana_sensor.name
  policy_arn = aws_iam_policy.instana_monitoring.arn
}