terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }

    backend "s3" {
    bucket       = "state-bucket-tf-charlao"
    region     = "us-east-1"
    key        = "terraform.tfstate"
    encrypt = true
  }


}




provider "aws" {
  # Configuration options
}


resource "aws_s3_bucket" "state-bucket" {
  bucket = var.state_bucket_name

  lifecycle {
    prevent_destroy = true
  }


}

resource "aws_s3_bucket_versioning" "state-bucket" {
  bucket = aws_s3_bucket.state-bucket.bucket
  
  versioning_configuration {
    status = "Enabled"
  }
  depends_on = [aws_s3_bucket.state-bucket]
}