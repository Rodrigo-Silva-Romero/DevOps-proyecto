resource "aws_cloudwatch_dashboard" "ecr_dashboard" {
  dashboard_name = "${var.environment}-ecr-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type  = "metric"
        x     = 0
        y     = 0
        width = 12
        height = 6
        properties = {
          metrics = [
            [ "AWS/ECR", "ImageCount", "RepositoryName", var.repository_name ]
          ]
          period = 300
          stat   = "Maximum"
          region = var.aws_region
          title  = "ECR Image Count"
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
            [ "AWS/ECR", "RepositorySizeBytes", "RepositoryName", var.repository_name ]
          ]
          period = 300
          stat   = "Maximum"
          region = var.aws_region
          title  = "ECR Repository Size (Bytes)"
        }
      }
    ]
  })
}

# Alarm: Si hay vulnerabilidades en la última imagen escaneada
resource "aws_cloudwatch_metric_alarm" "ecr_vuln_alarm" {
  alarm_name          = "${var.environment}-ecr-vulnerabilities"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ImageScanFindingsCount"
  namespace           = "AWS/ECR"
  period              = 300
  statistic           = "Maximum"
  threshold           = 0
  dimensions = {
    RepositoryName = var.repository_name
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}

# Alarm: Si el tamaño del repositorio supera cierto límite (ejemplo: 5 GB)
resource "aws_cloudwatch_metric_alarm" "ecr_size_alarm" {
  alarm_name          = "${var.environment}-ecr-size-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "RepositorySizeBytes"
  namespace           = "AWS/ECR"
  period              = 300
  statistic           = "Maximum"
  threshold           = 5 * 1024 * 1024 * 1024
  dimensions = {
    RepositoryName = var.repository_name
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}
