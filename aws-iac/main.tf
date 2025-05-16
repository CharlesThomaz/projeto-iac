module "s3" {
  source      = "./modules/s3"
  bucket_name = "charlao-bucket-iac"
}

module "cloudfront" {
  source                = "./modules/cloudfront"
  bucket_name           = module.s3.bucket_id
  s3_bucket_domain_name = module.s3.bucket_regional_domain_name
}

resource "aws_s3_bucket" "bucket" {
  bucket = "charlao-bucket-iac"

  tags = {
    Name = "charlao-bucket-iac"
  }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


