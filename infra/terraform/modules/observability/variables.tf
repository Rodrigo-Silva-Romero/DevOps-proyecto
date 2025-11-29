variable "repository_names" {
  type        = map(string)
  description = "Mapa de repositorios ECR a monitorear. Key = nombre lógico, value = nombre del repositorio"
}

variable "environment" {
  type        = string
  description = "Nombre del ambiente"
}

variable "aws_region" {
  type        = string
  description = "Región AWS"
}

variable "sns_topic_arn" {
  type        = string
  default     = ""
  description = "ARN del topic SNS para alarmas"
}
