variable "repository_names" {
  description = "Lista de nombres de repositorios ECR a monitorear"
  type        = list(string)
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
