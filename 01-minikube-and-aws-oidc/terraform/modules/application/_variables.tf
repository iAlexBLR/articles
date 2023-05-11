variable "openid" {
  description = <<-EOT
    OpenID configuration.
  EOT
  type = object({
    arn      = string
    issuer   = string
    audience = string
  })
  validation {
    condition     = var.openid != null
    error_message = "OpenID configuration must not be null."
  }
}
