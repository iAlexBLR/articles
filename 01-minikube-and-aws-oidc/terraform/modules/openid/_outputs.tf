output "arn" {
  description = "OpenID connection arn."
  value       = aws_iam_openid_connect_provider.this.arn
}

output "issuer" {
  description = "OpenID issuer."
  value       = local.oidc_issuer
}

output "audience" {
  description = "OpenID connection audience."
  value       = var.openid_audience
}

output "public" {
  description = "OpenID public configuration."
  value = {
    configuration = "https://${aws_s3_bucket.this.bucket_regional_domain_name}/${var.openid_configuration_path}"
    jwks          = "https://${aws_s3_bucket.this.bucket_regional_domain_name}/${var.openid_jwks_path}"
  }
}
