# Dashboard ECS
resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "${var.environment}-ecs-dashboard"

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
            [ "AWS/ECS", "CPUUtilization", "ClusterName", var.cluster_name, "ServiceName", var.service_name ],
            [ ".", "MemoryUtilization", ".", ".", ".", "." ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "ECS CPU / Memory Utilization"
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
            [ "AWS/ECS", "RunningTaskCount", "ClusterName", var.cluster_name, "ServiceName", var.service_name ],
            [ ".", "PendingTaskCount", ".", ".", ".", "." ]
          ]
          period = 300
          stat   = "Sum"
          region = var.aws_region
          title  = "ECS Tasks Running / Pending"
        }
      }
    ]
  })
}

# Alarm CPU alta
resource "aws_cloudwatch_metric_alarm" "ecs_cpu_high" {
  alarm_name          = "${var.environment}-ecs-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alert when ECS CPU > 80%"
  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}

# Alarm Memory alta
resource "aws_cloudwatch_metric_alarm" "ecs_mem_high" {
  alarm_name          = "${var.environment}-ecs-mem-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alert when ECS Memory > 80%"
  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}
