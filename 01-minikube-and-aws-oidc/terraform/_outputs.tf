output "openid_public" {
  description = "Public location of openid configuration."
  value       = module.openid.public
}

output "pod" {
  description = "Pod info of the application."
  value       = var.enable_application ? module.application["true"].pod : null
}
