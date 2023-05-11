resource "aws_iam_role" "this" {
  name               = var.iam_role
  assume_role_policy = data.aws_iam_policy_document.assume.json

  inline_policy {
    name   = "s3_list"
    policy = data.aws_iam_policy_document.s3_list.json
  }
}
