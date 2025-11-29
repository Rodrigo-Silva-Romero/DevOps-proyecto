variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

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

