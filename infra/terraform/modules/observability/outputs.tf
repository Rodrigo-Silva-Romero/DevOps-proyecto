output "dashboard_name" {
  value       = aws_cloudwatch_dashboard.vpc_dashboard.dashboard_name
  description = "Nombre del CloudWatch dashboard"
}
output "network_in_zero_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.network_in_zero.arn
  description = "ARN of network-in-zero CloudWatch alarm"
}

output "network_out_high_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.network_out_high.arn
  description = "ARN of network-out-high CloudWatch alarm"
}

