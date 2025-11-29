output "dashboard_name" {
  value       = aws_cloudwatch_dashboard.ecs_dashboard.dashboard_name
  description = "Nombre del CloudWatch dashboard para ECS"
}

output "ecs_cpu_high_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.ecs_cpu_high.arn
  description = "ARN de la alarma de CPU alta ECS"
}

output "ecs_mem_high_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.ecs_mem_high.arn
  description = "ARN de la alarma de Memory alta ECS"
}
