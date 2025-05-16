output "s3_bucket_name" {
  value       = module.s3
  sensitive   = false
  description = "NOme do bucket S3"
}

output "cdn_domain" {
  value       = module.cloudfront
  sensitive   = false
  description = "Nome de domínio do CDN"
}
