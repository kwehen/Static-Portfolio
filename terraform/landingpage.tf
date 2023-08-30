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
  bucket                  = aws_s3_bucket.kwehen1.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "index"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "404"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/404.html"
  content_type = "text/html"
}

resource "aws_s3_object" "portfolio" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "portfolio"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/portfolio.html"
  content_type = "text/html"
}

resource "aws_s3_object" "under-construction" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "underconstruction"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/underconstruction.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Jon-Doe" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "jondoe"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/jondoe.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Contact-Side" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "contact"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/contact.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Chamberlain" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "chamberlain"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/chamberlain.html"
  content_type = "text/html"
}

resource "aws_s3_object" "London" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "london"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/london.html"
  content_type = "text/html"
}

resource "aws_s3_object" "PELondon" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "pelondon"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/pelondon.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Jacks" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "jacks"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/jacks.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Graduation" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "graduation"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/graduation.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Rich" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "rich"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/rich.html"
  content_type = "text/html"
}

resource "aws_s3_object" "NYC" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "nyc"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/nyc.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Duce" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "duce"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/duce.html"
  content_type = "text/html"
}

resource "aws_s3_object" "B2TM" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "b2tm"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/b2tm.html"
  content_type = "text/html"
}

resource "aws_s3_object" "PEATL" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "peatl"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/peatl.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Waterfall" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "waterfall"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/waterfall.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Brands" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "brands"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/brands.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Modeling" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "modeling"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/modeling.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Street" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "street"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/street.html"
  content_type = "text/html"
}

resource "aws_s3_object" "Individuals" {
  bucket = aws_s3_bucket.kwehen1.id
  key = "individuals"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/individuals.html"
  content_type = "text/html"
}

resource "aws_s3_object" "contact-css" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "contact.css"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/contact.css"
  content_type = "text/css"
}

resource "aws_s3_object" "stylesheet-css" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "stylesheet.css"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/stylesheet.css"
  content_type = "text/css"
}

resource "aws_s3_object" "port-style-css" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "port-style.css"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/port-style.css"
  content_type = "text/css"
}

resource "aws_s3_object" "script-js" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "script.js"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/script.js"
  content_type = "text/javascript"
}

resource "aws_s3_object" "portfolio-script-js" {
  bucket       = aws_s3_bucket.kwehen1.id
  key          = "portfolio-script.js"
  source       = "/Users/kwehen/Desktop/AWS/Static Portfolio/portfolio-script.js"
  content_type = "text/javascript"
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
    suffix = "index"
  }

  error_document {
    key = "404"
  }
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
  name                              = "kwehen-OAC"
  description                       = "OAC for KweHen"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_origin_access_identity" "kwehen-origin" {

}

resource "aws_cloudfront_cache_policy" "S3-Optimized" {
  name        = "S3-Optimized"
  min_ttl     = 1
  max_ttl     = 31536000
  default_ttl = 86400
  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }
    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip   = true
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

resource "aws_cloudfront_function" "CF-Redirect" {
  name    = "CF-Redirect"
  runtime = "cloudfront-js-1.0"
  comment = "Function to Redirect to Domain Name"
  publish = true
  code    = file("/Users/kwehen/Desktop/AWS/Static Portfolio/cf-function.js")
}

resource "aws_cloudfront_response_headers_policy" "kwehen-cf-response" {
  name = "kwehen-security-headers"
  security_headers_config {
    frame_options {
      frame_option = "DENY"
      override     = true
    }

    strict_transport_security {
      access_control_max_age_sec = "63072000"
      include_subdomains         = true
      preload                    = true
      override                   = true
    }
  }
}

resource "aws_cloudfront_distribution" "kwehen-cf" {
  origin {
    domain_name              = aws_s3_bucket.kwehen1.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.kwehen-OAC.id
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = false
  comment             = "kwehen-cf"
  default_root_object = "index"
  aliases             = ["${var.domain_name}"]

  default_cache_behavior {
    cache_policy_id        = aws_cloudfront_cache_policy.S3-Optimized.id
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    viewer_protocol_policy = "redirect-to-https"
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.s3_origin_id

    response_headers_policy_id = aws_cloudfront_response_headers_policy.kwehen-cf-response.id

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.CF-Redirect.arn
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.certificate_id
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE", "IN", "IR", "JM"]
    }
  }
}

resource "aws_route53_record" "kwehen" {
  zone_id = var.record_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.kwehen-cf.domain_name
    zone_id                = aws_cloudfront_distribution.kwehen-cf.hosted_zone_id
    evaluate_target_health = false
  }

}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.kwehen-cf.domain_name
}