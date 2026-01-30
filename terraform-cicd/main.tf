provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "website" {
    bucket = var.bucket_name
    force_destroy = true

    tags = {
        Name = "Website Bucket"
        Environment = var.environment
    }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
    bucket = aws_s3_bucket.website.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "index.html"
    }
}

resource "aws_s3_bucket_public_access_block" "website_public_access" {
    bucket = aws_s3_bucket.website.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

# Ensure bucket object ownership is explicitly set to BucketOwnerEnforced when possible.
# This disables ACLs at the account/bucket level so only policies are used for access control.
resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.website.id

  depends_on = [aws_s3_bucket_public_access_block.website_public_access]

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_policy" "website_policy" {
    bucket = aws_s3_bucket.website.id

    depends_on = [aws_s3_bucket_public_access_block.website_public_access]

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid       = "PublicReadGetObject"
                Effect    = "Allow"
                Principal = "*"
                Action    = "s3:GetObject"
                Resource  = "${aws_s3_bucket.website.arn}/*"
            }
        ]
    })
}

resource "aws_s3_bucket_cors_configuration" "website_cors" {
    bucket = aws_s3_bucket.website.id

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["GET", "HEAD"]
        allowed_origins = ["*"]
        max_age_seconds = 3000
    }
}