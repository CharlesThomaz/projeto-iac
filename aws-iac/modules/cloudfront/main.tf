resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "OAI para acessar bucket privado"
}

resource "aws_cloudfront_distribution" "cdn_charlao" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = "S3-origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Distribuição CloudFront para S3"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "S3-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
