variable "repository_name" {
  description = "Nombre del repositorio ECR a monitorear"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN para notificaciones de alarma"
  type        = string
  default     = ""
}
