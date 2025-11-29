# Dashboard con widgets para cada repositorio
resource "aws_cloudwatch_dashboard" "ecr_dashboard" {
  dashboard_name = "${var.environment}-ecr-dashboard"

  dashboard_body = jsonencode({
    widgets = flatten([
      for repo in var.repository_names : [
        {
          type  = "metric"
          x     = 0
          y     = 0
          width = 12
          height = 6
          properties = {
            metrics = [
              [ "AWS/ECR", "ImageCount", "RepositoryName", repo ]
            ]
            period = 300
            stat   = "Maximum"
            region = var.aws_region
            title  = "ECR Image Count - ${repo}"
          }
        },
        {
          type  = "metric"
          x     = 0
          y     = 6
          width = 12
          height = 6
          properties = {
            metrics = [
              [ "AWS/ECR", "RepositorySizeBytes", "RepositoryName", repo ]
            ]
            period = 300
            stat   = "Maximum"
            region = var.aws_region
            title  = "ECR Repository Size - ${repo}"
          }
        }
      ]
    ])
  })
}

# Alarmas por cada repositorio
resource "aws_cloudwatch_metric_alarm" "ecr_vuln_alarm" {
  for_each = toset(var.repository_names)
  alarm_name          = "${var.environment}-ecr-${each.value}-vulnerabilities"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ImageScanFindingsCount"
  namespace           = "AWS/ECR"
  period              = 300
  statistic           = "Maximum"
  threshold           = 0
  dimensions = {
    RepositoryName = each.value
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}

resource "aws_cloudwatch_metric_alarm" "ecr_size_alarm" {
  for_each = toset(var.repository_names)
  alarm_name          = "${var.environment}-ecr-${each.value}-size-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "RepositorySizeBytes"
  namespace           = "AWS/ECR"
  period              = 300
  statistic           = "Maximum"
  threshold           = 5 * 1024 * 1024 * 1024
  dimensions = {
    RepositoryName = each.value
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}
