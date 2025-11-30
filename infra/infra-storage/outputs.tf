output "ecr_urls" {
  value = module.ecr.this[*].repository_url
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

