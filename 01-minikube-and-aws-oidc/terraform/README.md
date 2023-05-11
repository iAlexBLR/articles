# Module: main

This project creates and configures the following blocks:
* AWS OpenID provider for the local Minikube cluster
* Deploys admission webhook to the Kubernetes cluster that sets AWS credentials automatically
* Deploys test application to prove that everything works perfectly

# Module structure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.9.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.20.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_admission_webhook"></a> [admission\_webhook](#module\_admission\_webhook) | ./modules/admission_webhook | n/a |
| <a name="module_application"></a> [application](#module\_application) | ./modules/application | n/a |
| <a name="module_openid"></a> [openid](#module\_openid) | ./modules/openid | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Default AWS region. | `string` | n/a | yes |
| <a name="input_enable_application"></a> [enable\_application](#input\_enable\_application) | True if the test application should be deployed. | `bool` | `true` | no |
| <a name="input_openid_folder"></a> [openid\_folder](#input\_openid\_folder) | Local folder path that contains OpenID configuration. | `string` | n/a | yes |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | Name of the S3 bucket that stores OpenID configuration. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_openid_public"></a> [openid\_public](#output\_openid\_public) | Public location of openid configuration. |
| <a name="output_pod"></a> [pod](#output\_pod) | Pod info of the application. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
