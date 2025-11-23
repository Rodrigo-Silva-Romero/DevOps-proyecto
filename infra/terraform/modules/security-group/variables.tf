variable "vpc_id" { type = string }
variable "vpc_cidr" { type = string }
variable "environment" { type = string }
variable "api_gateway_port" { type = number }
variable "alb_sg_id" {
  description = "Security Group ID del ALB para permitir tráfico hacia ECS"
  type        = string
}
