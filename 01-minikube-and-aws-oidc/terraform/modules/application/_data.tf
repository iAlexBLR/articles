data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.openid.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${var.openid.issuer}:sub"
      values   = ["system:serviceaccount:${var.namespace}:${var.service_account}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${var.openid.issuer}:aud"
      values   = [var.openid.audience]
    }
  }
}

data "aws_iam_policy_document" "s3_list" {
  statement {
    sid       = "S3ListBuckets"
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["*"]
  }
}
