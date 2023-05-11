# Module: openid

`openid` is a terraform module that creates and configures S3 bucket to store publicly custom OpenID configuration files and AWS IODC provider to use this configurations.

# Module structure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.66 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.66 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_object.openid_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.openid_jwks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_iam_policy_document.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.openid](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_openid_audience"></a> [openid\_audience](#input\_openid\_audience) | OpenID provider audience. | `string` | `"sts.amazonaws.com"` | no |
| <a name="input_openid_configuration_path"></a> [openid\_configuration\_path](#input\_openid\_configuration\_path) | Path to the OpenID configuration file in the folder structure. | `string` | `".well-known/openid-configuration"` | no |
| <a name="input_openid_folder"></a> [openid\_folder](#input\_openid\_folder) | Local folder path that contains OpenID configuration. | `string` | n/a | yes |
| <a name="input_openid_jwks_path"></a> [openid\_jwks\_path](#input\_openid\_jwks\_path) | Path to the OpenID JWKs file in the folder structure. | `string` | `"openid/v1/jwks"` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | Name of the S3 bucket that stores OpenID configuration. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | OpenID connection arn. |
| <a name="output_audience"></a> [audience](#output\_audience) | OpenID connection audience. |
| <a name="output_issuer"></a> [issuer](#output\_issuer) | OpenID issuer. |
| <a name="output_public"></a> [public](#output\_public) | OpenID public configuration. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
