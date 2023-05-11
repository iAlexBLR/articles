resource "kubernetes_service_account" "this" {
  metadata {
    name      = var.service_account
    namespace = var.namespace
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.this.arn
    }
  }
}

resource "kubernetes_config_map" "this" {
  metadata {
    name      = var.config_map_name
    namespace = var.namespace
  }

  data = {
    "entrypoint.sh" = file(local.entrypoint_script)
  }
}

resource "kubernetes_pod" "this" {
  metadata {
    name      = local.pod_name
    namespace = var.namespace
    annotations = {
      "applicatoin/entrypoint-sha" = local.entrypoint_script_sha
    }
  }

  spec {
    service_account_name = var.service_account

    container {
      name    = "main"
      image   = "public.ecr.aws/aws-cli/aws-cli:latest"
      command = ["/entrypoint.sh"]
      args    = []

      volume_mount {
        name       = "entrypoint"
        mount_path = "/entrypoint.sh"
        sub_path   = "entrypoint.sh"
        read_only  = false
      }
    }

    volume {
      name = "entrypoint"
      config_map {
        name = var.pod_name
        items {
          key  = "entrypoint.sh"
          path = "entrypoint.sh"
        }
        default_mode = "0500"
      }
    }
  }

  depends_on = [
    kubernetes_service_account.this,
    kubernetes_config_map.this
  ]

  lifecycle {
    ignore_changes = [
      spec[0].container,
      spec[0].volume
    ]
  }
}
