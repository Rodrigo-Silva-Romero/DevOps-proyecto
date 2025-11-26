variable "environment" {
  type = string
}

variable "service_name" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "task_definition_arn" {
  type    = string
  default = ""
}

variable "desired_count" {
  type = number
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "assign_public_ip" {
  type = bool
}

variable "target_group_arn" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "ecr_product_url" {
  type = string
}

variable "ecr_inventory_url" {
  type = string
}

variable "ecr_api_url" {
  type = string
}
