data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    sid = "AllowPublicObjects"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "${aws_s3_bucket.this.arn}/${var.openid_configuration_path}",
      "${aws_s3_bucket.this.arn}/${var.openid_jwks_path}"
    ]
  }
}

data "tls_certificate" "openid" {
  url = "https://${local.oidc_issuer}"
}
