# Exponer el mapa completo de URLs
output "ecr_urls" {
  value = module.ecr.ecr_urls
}

# Si querés exponer cada URL individual (para el pipeline)
output "ecr_api_url" {
  value = module.ecr.ecr_urls["apigateway"]
}

output "ecr_product_url" {
  value = module.ecr.ecr_urls["product"]
}

output "ecr_inventory_url" {
  value = module.ecr.ecr_urls["inventory"]
}

# Bucket S3
output "s3_bucket_name" {
  value = module.s3.bucket_name
}
