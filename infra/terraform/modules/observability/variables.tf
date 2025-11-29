variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}

variable "service_name" {
  description = "ECS Service Name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN for alarm notifications"
  type        = string
  default     = ""
}
