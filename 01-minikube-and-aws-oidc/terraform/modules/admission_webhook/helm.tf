resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.cert_manager_version
  namespace  = var.cert_manager_namespace

  dependency_update = true
  atomic            = true
  create_namespace  = true

  values = [
    <<-EOT
      installCRDs: true
      fullnameOverride: cert-manager
    EOT
  ]
}

resource "helm_release" "admission_webhook" {
  name       = "amazon-eks-pod-identity-webhook"
  repository = "https://jkroepke.github.io/helm-charts"
  chart      = "amazon-eks-pod-identity-webhook"
  version    = var.admission_webhook_version
  namespace  = var.admission_webhook_namespace

  dependency_update = true
  atomic            = true
  create_namespace  = true

  values = [
    <<-EOT
      config:
        defaultAwsRegion: ${var.aws_region}

      resources:
        limits:
          cpu: 100m
          memory: 128Mi
        requests:
          cpu: 100m
          memory: 128Mi
    EOT
  ]
  depends_on = [
    helm_release.cert_manager
  ]
}
