module "eks-crossplane-argocd" {
  source    = "./eks"
  env       = var.env
  accountId = var.accountId
}

module "aws-auth-cm" {
  source = "./aws-auth-cm"
  accountId = var.accountId
}

module "s3" {
  source = "./s3"
}