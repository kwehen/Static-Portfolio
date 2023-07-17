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
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/underconstruction.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Jon-Doe" {
  bucket = aws_s3_bucket.kwehen1.id
  key = "jondoe.html"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/jondoe.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "kwehen-policy" {
  bucket = aws_s3_bucket.kwehen1.id
  depends_on = [
    aws_s3_bucket_public_access_block.kwehen-access-block,
    aws_s3_bucket.kwehen1,
    aws_cloudfront_distribution.kwehen-cf
    ]

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::kwehen1/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "${aws_cloudfront_distribution.kwehen-cf.arn}"
                }
            }
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

resource "aws_cloudfront_origin_access_control" "kwehen-OAC" {
  name = "kwehen-OAC"
  description = "OAC for KweHen"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_origin_access_identity" "kwehen-origin" {

}

resource "aws_cloudfront_cache_policy" "S3-Optimized" {
  name = "S3-Optimized"
  min_ttl = 1
  max_ttl = 31536000
  default_ttl = 86400
  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }
    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip = true
    headers_config {
      header_behavior = "none"
    }
    query_strings_config {
      query_string_behavior = "none"
    }
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_cloudfront_distribution" "kwehen-cf" {
  origin {
    domain_name = aws_s3_bucket.kwehen1.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.kwehen-OAC.id
    origin_id = local.s3_origin_id
  }

  enabled = true
  is_ipv6_enabled = false
  comment = "kwehen-cf"
  default_root_object = "index.html"

  default_cache_behavior {
    cache_policy_id = aws_cloudfront_cache_policy.S3-Optimized.id
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    viewer_protocol_policy = "redirect-to-https"
    cached_methods = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    }
  
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE", "IN", "IR"]
    }
  }
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.kwehen-cf.domain_name
}
