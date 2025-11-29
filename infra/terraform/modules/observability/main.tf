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
            [ "AWS/ECS", "RunningTaskCount", "ClusterName", var.cluster_name, "ServiceName", var.service_name ],
            [ ".", "PendingTaskCount", ".", ".", ".", "." ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "ECS Tasks Running / Pending"
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
            [ "AWS/ECS", "CPUUtilization", "ClusterName", var.cluster_name, "ServiceName", var.service_name ],
            [ ".", "MemoryUtilization", ".", ".", ".", "." ]
          ]
          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "ECS CPU / Memory Utilization"
        }
      }
    ]
  })
}

# Alarm si no hay tareas corriendo
resource "aws_cloudwatch_metric_alarm" "ecs_no_running" {
  alarm_name          = "${var.environment}-ecs-no-running-tasks"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "RunningTaskCount"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 1
  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}

# Alarm si tareas pendientes se mantienen
resource "aws_cloudwatch_metric_alarm" "ecs_pending_high" {
  alarm_name          = "${var.environment}-ecs-pending-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "PendingTaskCount"
  namespace           = "AWS/ECS"
  period              = 300
  statistic           = "Average"
  threshold           = 0
  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }
  alarm_actions = var.sns_topic_arn != "" ? [var.sns_topic_arn] : []
}
