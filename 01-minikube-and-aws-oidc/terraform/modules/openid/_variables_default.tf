variable "openid_configuration_path" {
  description = "Path to the OpenID configuration file in the folder structure."
  type        = string
  default     = ".well-known/openid-configuration"
  validation {
    condition     = length(compact([null, "", var.openid_configuration_path])) > 0
    error_message = "Path to the OpenID configuration file must not be empty."
  }
}

variable "openid_jwks_path" {
  description = "Path to the OpenID JWKs file in the folder structure."
  type        = string
  default     = "openid/v1/jwks"
  validation {
    condition     = length(compact([null, "", var.openid_jwks_path])) > 0
    error_message = "Path to the OpenID JWKs file must not be empty."
  }
}

variable "openid_audience" {
  description = "OpenID provider audience."
  type        = string
  default     = "sts.amazonaws.com"
  validation {
    condition     = length(compact([null, "", var.openid_audience])) > 0
    error_message = "OpenID provider audience must not be empty."
  }
}
