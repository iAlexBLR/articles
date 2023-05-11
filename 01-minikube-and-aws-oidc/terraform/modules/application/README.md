# Module: application

`application` is a terraform module that creates and configures:
* IAM role with permissins to list S3 buckets
* Kubernetes service account with IAM role attached to it
* Test Kubernetes application that assumes this service account and tests the credentials

# Module structure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.66 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [kubernetes_config_map.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_pod.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/pod) | resource |
| [kubernetes_service_account.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [aws_iam_policy_document.assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_map_name"></a> [config\_map\_name](#input\_config\_map\_name) | Kubernetes config map name. | `string` | `"application"` | no |
| <a name="input_iam_role"></a> [iam\_role](#input\_iam\_role) | Name of the IAM role that is used to test configuration. | `string` | `"k8s-s3-list-buckets-role"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Kubernetes namespace. | `string` | `"default"` | no |
| <a name="input_openid"></a> [openid](#input\_openid) | OpenID configuration. | <pre>object({<br>    arn      = string<br>    issuer   = string<br>    audience = string<br>  })</pre> | n/a | yes |
| <a name="input_pod_name"></a> [pod\_name](#input\_pod\_name) | Kubernetes pod name. | `string` | `"application"` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Kubernetes service account name that assumes IAM role. | `string` | `"s3-list-buckets"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pod"></a> [pod](#output\_pod) | Pod info of the application. |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of the iam role created for the application. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
