locals {
  oidc_issuer = aws_s3_bucket.this.bucket_regional_domain_name
}
