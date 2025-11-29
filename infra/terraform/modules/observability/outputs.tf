output "dashboard_name" {
  value       = aws_cloudwatch_dashboard.ecs_dashboard.dashboard_name
  description = "Nombre del CloudWatch dashboard ECS"
}

output "ecs_no_running_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.ecs_no_running.arn
  description = "ARN of ECS no running tasks alarm"
}

output "ecs_pending_high_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.ecs_pending_high.arn
  description = "ARN of ECS pending high tasks alarm"
}
