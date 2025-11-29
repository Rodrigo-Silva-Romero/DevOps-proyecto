output "dashboard_arn" {
  value       = aws_cloudwatch_dashboard.vpc_dashboard.arn
  description = "CloudWatch dashboard ARN"
}

output "network_in_zero_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.network_in_zero.arn
  description = "ARN of network-in-zero CloudWatch alarm"
}

output "network_out_high_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.network_out_high.arn
  description = "ARN of network-out-high CloudWatch alarm"
}

