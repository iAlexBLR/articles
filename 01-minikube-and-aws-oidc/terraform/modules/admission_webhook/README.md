# Module: admission_webhook

`admission_webhook` is a terraform module that deploys two helm charts into the given Kubernetes cluster:
* (amazon-eks-pod-identity-webhook)[https://artifacthub.io/packages/helm/jkroepke/amazon-eks-pod-identity-webhook] - is a mutating admission webhook that passes AWS credentials to pods automatically
* (cert-manager)[https://artifacthub.io/packages/helm/cert-manager/cert-manager] - is a dependency of amazon-eks-pod-identity-webhook applicaition

# Module structure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.admission_webhook](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admission_webhook_namespace"></a> [admission\_webhook\_namespace](#input\_admission\_webhook\_namespace) | Namespace the amazon eks pod identity webhook resources are located in. | `string` | `"kube-system"` | no |
| <a name="input_admission_webhook_version"></a> [admission\_webhook\_version](#input\_admission\_webhook\_version) | Version of the amazon eks pod identity webhook helm chart. | `string` | `"1.2.0"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Default AWS region. | `string` | n/a | yes |
| <a name="input_cert_manager_namespace"></a> [cert\_manager\_namespace](#input\_cert\_manager\_namespace) | Namespace the certificate manager resources are located in. | `string` | `"kube-system"` | no |
| <a name="input_cert_manager_version"></a> [cert\_manager\_version](#input\_cert\_manager\_version) | Version of the certificate manager helm chart. | `string` | `"1.11.2"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
