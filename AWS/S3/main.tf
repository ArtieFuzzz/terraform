provider "aws" {
  profile = "default"
  region  = var.provider_region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl = "public-read"

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_policy" "storage_bucket_policy" {
  bucket = resource.aws_s3_bucket.bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement =  [
      {
        Sid: "AllowPublicRead"
        Effect: "Allow"
        Principal: "*"
        Action: "s3:GetObject"
        Resource: [aws_s3_bucket.bucket.arn,
        "${aws_s3_bucket.bucket.arn}/*"]
      }
    ]
  })
}