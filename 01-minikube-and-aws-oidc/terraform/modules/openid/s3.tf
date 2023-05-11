resource "aws_s3_bucket" "this" {
  bucket = var.s3_bucket
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

resource "aws_s3_object" "openid_configuration" {
  bucket        = aws_s3_bucket.this.bucket
  key           = var.openid_configuration_path
  source        = "${var.openid_folder}/${var.openid_configuration_path}"
  etag          = filemd5("${var.openid_folder}/${var.openid_configuration_path}")
  force_destroy = true
}

resource "aws_s3_object" "openid_jwks" {
  bucket        = aws_s3_bucket.this.bucket
  key           = var.openid_jwks_path
  source        = "${var.openid_folder}/${var.openid_jwks_path}"
  etag          = filemd5("${var.openid_folder}/${var.openid_jwks_path}")
  force_destroy = true
}
