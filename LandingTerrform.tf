resource "aws_s3_bucket" "kwehen1" {
  bucket        = "kwehen1"
  force_destroy = true

  tags = {
    Name = "kwehen1"
  }
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
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.kwehen1.id
  key    = "404.html"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/404.html"
}

resource "aws_s3_object" "portfolio" {
  bucket = aws_s3_bucket.kwehen1.id
  key = "portfolio.html"
  source = "/Users/kwehen/Desktop/AWS/Static Portfolio/portfolio.html"
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
      "Action": ["s3:GetObject"],
      "Resource": ["arn:aws:s3:::kwehen1/*"]
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
