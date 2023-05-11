# Configuring Minikube Kubernetes cluster to pass AWS credentials to pods the EKS way

export S3_BUCKET="k8s-openid-configuration"
export S3_BUCKET_URL="https://${S3_BUCKET}.s3.${AWS_REGION}.amazonaws.com"
export OPENID_FOLDER="/tmp/openid-config"

minikube start \
  --extra-config=apiserver.service-account-issuer="${S3_BUCKET_URL}" \
  --extra-config=apiserver.service-account-jwks-uri="${S3_BUCKET_URL}/openid/v1/jwks"

export AWS_PROFILE=personal
export AWS_REGION=eu-central-1
kubectl config use-context minikube

./scripts/expose.sh 9000 "${OPENID_FOLDER}"
tree -a "${OPENID_FOLDER}"

cd terraform
terraform init
terraform apply \
  -var="aws_region=${AWS_REGION}" \
  -var="s3_bucket=${S3_BUCKET}" \
  -var="openid_folder=${OPENID_FOLDER}"

minikube delete
terraform destroy \
  -var="aws_region=${AWS_REGION}" \
  -var="s3_bucket=${S3_BUCKET}" \
  -var="openid_folder=${OPENID_FOLDER}"

Links:
* https://kubernetes.io/docs/tasks/administer-cluster/access-cluster-api/
* https://artifacthub.io/packages/helm/jkroepke/amazon-eks-pod-identity-webhook
* https://artifacthub.io/packages/helm/cert-manager/cert-manager
