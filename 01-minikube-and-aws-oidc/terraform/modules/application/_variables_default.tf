variable "iam_role" {
  description = "Name of the IAM role that is used to test configuration."
  type        = string
  default     = "k8s-s3-list-buckets-role"
  validation {
    condition     = length(compact([null, "", var.iam_role])) > 0
    error_message = "Name of the IAM role must not be empty."
  }
}

variable "namespace" {
  description = "Kubernetes namespace."
  type        = string
  default     = "default"
  validation {
    condition     = length(compact([null, "", var.namespace])) > 0
    error_message = "Kubernetes namespace must not be null."
  }
}

variable "service_account" {
  description = "Kubernetes service account name that assumes IAM role."
  type        = string
  default     = "s3-list-buckets"
  validation {
    condition     = length(compact([null, "", var.service_account])) > 0
    error_message = "Kubernetes service account name must not be null."
  }
}

variable "config_map_name" {
  description = "Kubernetes config map name."
  type        = string
  default     = "application"
  validation {
    condition     = length(compact([null, "", var.config_map_name])) > 0
    error_message = "Kubernetes config map name must not be null."
  }
}

variable "pod_name" {
  description = "Kubernetes pod name."
  type        = string
  default     = "application"
  validation {
    condition     = length(compact([null, "", var.pod_name])) > 0
    error_message = "Kubernetes pod name must not be null."
  }
}
