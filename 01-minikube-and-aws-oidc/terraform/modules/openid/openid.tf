resource "aws_iam_openid_connect_provider" "this" {
  url             = "https://${local.oidc_issuer}"
  client_id_list  = [var.openid_audience]
  thumbprint_list = [data.tls_certificate.openid.certificates[0].sha1_fingerprint]
}
