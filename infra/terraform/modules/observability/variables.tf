
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN for alarm notifications"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "service_name" {
  description = "ECS Service name"
  type        = string
}

