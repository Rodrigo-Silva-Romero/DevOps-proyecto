output "ecr_dashboard_name" {
  value       = aws_cloudwatch_dashboard.ecr_dashboard.dashboard_name
  description = "Nombre del CloudWatch dashboard para ECR"
}

output "ecr_vuln_alarm_arns" {
  value       = [for a in aws_cloudwatch_metric_alarm.ecr_vuln_alarm : a.arn]
  description = "ARNs de alarmas de vulnerabilidades ECR"
}

output "ecr_size_alarm_arns" {
  value       = [for a in aws_cloudwatch_metric_alarm.ecr_size_alarm : a.arn]
  description = "ARNs de alarmas de tamaño de repositorios ECR"
}
