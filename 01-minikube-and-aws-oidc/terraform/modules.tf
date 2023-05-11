module "openid" {
  source        = "./modules/openid"
  s3_bucket     = var.s3_bucket
  openid_folder = var.openid_folder
}

module "admission_webhook" {
  source     = "./modules/admission_webhook"
  aws_region = var.aws_region
}

module "application" {
  for_each = toset(var.enable_application ? ["true"] : [])
  source   = "./modules/application"
  openid = {
    arn      = module.openid.arn
    issuer   = module.openid.issuer
    audience = module.openid.audience
  }
  depends_on = [
    module.admission_webhook
  ]
}
