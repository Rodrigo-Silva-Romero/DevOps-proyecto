
#VPC
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "sender_email" {
  description = "Email del remitente"
  type        = string
}

variable "app_password" {
  description = "App password del Gmail para SMTP"
  type        = string
}

variable "apigateway_port" {
  type = number
  description = "Puerto que expone el API Gateway"
}

variable "ecr_product_url" {
  type        = string
  description = "URL del repositorio ECR para product"
}

variable "ecr_inventory_url" {
  type        = string
  description = "URL del repositorio ECR para inventory"
}

variable "ecr_api_url" {
  type        = string
  description = "URL del repositorio ECR para apigateway"
}
