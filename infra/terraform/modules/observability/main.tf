# CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "vpc_dashboard" {
  dashboard_name = "${var.environment}-vpc-dashboard"

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
            [ "AWS/NetworkInterface", "NetworkPacketsIn", "VpcId", var.vpc_id ],
            [ ".", "NetworkPacketsOut", ".", "." ]
          ]
          period = 300
          stat   = "Sum"
          region = var.aws_region
          title  = "Network Packets In/Out VPC"
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
            [ "AWS/NetworkInterface", "NetworkBytesIn", "VpcId", var.vpc_id ],
            [ ".", "NetworkBytesOut", ".", "." ]
          ]
          period = 300
          stat   = "Sum"
          region = var.aws_region
          title  = "Network Bytes In/Out VPC"
        }
      }
    ]
  })
}

# Alarm: tráfico entrante cero en 5 minutos
resource "aws_cloudwatch_metric_alarm" "network_in_zero" {
  alarm_name          = "${var.environment}-network-in-zero"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "NetworkBytesIn"
  namespace           = "AWS/NetworkInterface"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alert when VPC receives almost no traffic"
  dimensions = {
    VpcId = var.vpc_id
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}

# Alarm: tráfico saliente alto
resource "aws_cloudwatch_metric_alarm" "network_out_high" {
  alarm_name          = "${var.environment}-network-out-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "NetworkBytesOut"
  namespace           = "AWS/NetworkInterface"
  period              = 300
  statistic           = "Sum"
  threshold           = 1000000000 # 1GB
  alarm_description   = "Alert when VPC sends too much traffic"
  dimensions = {
    VpcId = var.vpc_id
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}
