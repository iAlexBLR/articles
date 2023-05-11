variable "aws_region" {
  description = "Default AWS region."
  type        = string
  validation {
    condition     = length(compact([null, "", var.aws_region])) > 0
    error_message = "AWS region name must not be empty."
  }
}
