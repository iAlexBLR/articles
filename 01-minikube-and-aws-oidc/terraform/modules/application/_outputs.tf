output "role_arn" {
  description = "ARN of the iam role created for the application."
  value       = aws_iam_role.this.arn
}

output "pod" {
  description = "Pod info of the application."
  value = {
    name      = local.pod_name
    namespace = var.namespace
  }
}
