output "dashboard_name" {
  value       = aws_cloudwatch_dashboard.ecr_dashboard.dashboard_name
  description = "Nombre del CloudWatch dashboard ECR"
}

output "ecr_vuln_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.ecr_vuln_alarm.arn
  description = "ARN de la alarma de vulnerabilidades ECR"
}

output "ecr_size_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.ecr_size_alarm.arn
  description = "ARN de la alarma de tamaño alto del repositorio"
}
