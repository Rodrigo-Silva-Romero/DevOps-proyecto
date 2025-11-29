#VPC
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

#ECR
output "ecr_urls" {
  value = module.ecr.ecr_urls
}

output "cluster_id" {
  value = module.ecs_cluster.cluster_id
}

output "alb_dns" {
  description = "DNS del Application Load Balancer"
  value       = module.alb.alb_dns
}

output "ecs_service_names" {
  description = "Nombre del ECS Service creado"
  value       = module.ecs_service_core.service_names
}

# ECR individual outputs para uso con terraform -raw
output "ecr_api_url" {
  value = module.ecr.ecr_urls["apigateway"]
}

output "ecr_product_url" {
  value = module.ecr.ecr_urls["product"]
}

output "ecr_inventory_url" {
  value = module.ecr.ecr_urls["inventory"]
}

output "lambda_url" {
  value = module.lambda.lambda_url
}


output "ecs_dashboard_name" {
  value       = module.observability.dashboard_name
  description = "Nombre del CloudWatch dashboard ECS"
}

output "ecs_no_running_alarm_arn" {
  value       = module.observability.ecs_no_running_alarm_arn
  description = "ARN de la alarma ECS no running tasks"
}

output "ecs_pending_high_alarm_arn" {
  value       = module.observability.ecs_pending_high_alarm_arn
  description = "ARN de la alarma ECS pending high tasks"
}
