resource "aws_s3_bucket" "kwehen1" {
  bucket        = "kwehen1"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "kwehen-controls" {
  bucket = aws_s3_bucket.kwehen1.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "kwehen-access-block" {
  bucket                      = aws_s3_bucket.kwehen1.id
  block_public_acls           = false
  block_public_policy         = false
  ignore_public_acls          = false
  restrict_public_buckets     = false
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.kwehen1.id
  key    = "index.html"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.kwehen1.id
  key    = "404.html"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/404.html"
  content_type = "text/html"
}

resource "aws_s3_object" "portfolio" {
  bucket = aws_s3_bucket.kwehen1.id
  key = "portfolio.html"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/portfolio.html"
  content_type = "text/html"
}

resource "aws_s3_object" "under-construction" {
  bucket = aws_s3_bucket.kwehen1.id
  key = "underconstruction.html"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio//underconstruction.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "kwehen-policy" {
  bucket = aws_s3_bucket.kwehen1.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::kwehen1/*"
    }
  ]
}
EOF
}

resource "aws_s3_bucket_website_configuration" "kwehen-config" {
  bucket = aws_s3_bucket.kwehen1.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

output "bucket_domain_name" {
  value = aws_s3_bucket.kwehen1.website_endpoint
}

resource "aws_s3_bucket_server_side_encryption_configuration" "kwehen-encryption" {
  bucket = aws_s3_bucket.kwehen1.id

  rule {
    bucket_key_enabled = true
  }
}

locals {
  s3_origin_id = "kwehen1.s3-website-us-east-1.amazonaws.com"
}

resource "aws_cloudfront_origin_access_identity" "kwehen-origin" {
}

resource "aws_cloudfront_distribution" "kwehen-cf" {
  origin {
    custom_origin_config {
      http_port = "80"
      https_port = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    domain_name = "${aws_s3_bucket.kwehen1.website_endpoint}"
    origin_id = local.s3_origin_id
  }

  enabled = true
  is_ipv6_enabled = false
  comment = "kwehen-cf"
  default_root_object = "index.html"

  default_cache_behavior {
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"
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

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.kwehen-cf.domain_name
}
