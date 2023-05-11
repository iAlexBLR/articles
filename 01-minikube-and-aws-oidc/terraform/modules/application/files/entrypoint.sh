#!/usr/bin/env bash

set -e -o pipefail

get_sts_parameter() {
  local param
  param="${1}"

  aws sts get-caller-identity --output text --query "${param}"
}

echo -e "###### Fetching creds ######\n"
while ! aws sts get-caller-identity &>/dev/null; do
  echo "Connecting to AWS OpenID to fetch credentials..."
  sleep 3
done
echo -e "Connected!\n"

echo "###### AWS connection info ######

AWS Account: $(get_sts_parameter "Account")
AWS Region: ${AWS_REGION}
AWS IAM Role: ${AWS_ROLE_ARN}
AWS STS Session User: $(get_sts_parameter "UserId")
AWS STS Session: $(get_sts_parameter "Arn")
"

echo "###### Testing credentials ######

Command: aws s3 ls
Output:
$(aws s3 ls)
"

sleep infinity
