# ECR
variable "ecr_repositories" {
  type        = map(string)
  description = "Repositorios ECR por microservicio"
  default = {
    apigateway = "apigateway-ecr"
    product    = "product-ecr"
    inventory  = "inventory-ecr"
  }
}

# S3
variable "bucket_name" {
  type        = string
  description = "Nombre del bucket S3 para almacenar el tfstate"
  default     = "bucket-stockwiz-tf"
}

