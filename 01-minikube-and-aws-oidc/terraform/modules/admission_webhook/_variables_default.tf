variable "cert_manager_version" {
  description = "Version of the certificate manager helm chart."
  type        = string
  default     = "1.11.2"
  validation {
    condition     = length(compact([null, "", var.cert_manager_version])) > 0
    error_message = "Version of the certificate manager must not be empty."
  }
}

variable "cert_manager_namespace" {
  description = "Namespace the certificate manager resources are located in."
  type        = string
  default     = "kube-system"
  validation {
    condition     = length(compact([null, "", var.cert_manager_namespace])) > 0
    error_message = "Namespace the certificate manager resources must not be empty."
  }
}

variable "admission_webhook_version" {
  description = "Version of the amazon eks pod identity webhook helm chart."
  type        = string
  default     = "1.2.0"
  validation {
    condition     = length(compact([null, "", var.admission_webhook_version])) > 0
    error_message = "Version of the amazon eks pod identity webhook must not be empty."
  }
}

variable "admission_webhook_namespace" {
  description = "Namespace the amazon eks pod identity webhook resources are located in."
  type        = string
  default     = "kube-system"
  validation {
    condition     = length(compact([null, "", var.admission_webhook_namespace])) > 0
    error_message = "Namespace the amazon eks pod identity webhook resources must not be empty."
  }
}
