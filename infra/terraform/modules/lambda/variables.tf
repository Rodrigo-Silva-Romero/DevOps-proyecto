variable "lambda_name" {
  description = "Nombre único de la Lambda"
  type        = string
}

variable "sender_email" {
  type = string
}

variable "app_password" {
  type = string
}

variable "environment" {
  description = "Nombre del entorno (dev, staging, prod)"
  type        = string
}
