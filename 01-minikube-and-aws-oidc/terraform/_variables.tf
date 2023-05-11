variable "aws_region" {
  description = "Default AWS region."
  type        = string
  validation {
    condition     = length(compact([null, "", var.aws_region])) > 0
    error_message = "AWS region name must not be empty."
  }
}

variable "s3_bucket" {
  description = "Name of the S3 bucket that stores OpenID configuration."
  type        = string
  validation {
    condition     = length(compact([null, "", var.s3_bucket])) > 0
    error_message = "Name of the S3 bucket must not be empty."
  }
}

variable "openid_folder" {
  description = "Local folder path that contains OpenID configuration."
  type        = string
  validation {
    condition     = length(compact([null, "", var.openid_folder])) > 0
    error_message = "OpenID configuration path must not be empty."
  }
}
