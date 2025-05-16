variable "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  default     = "state-bucket-tf-charlao"
  type        = string
}