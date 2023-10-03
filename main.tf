module "eks-crossplane-argocd" {
  source    = "./eks"
  env       = var.env
  accountId = var.accountId
}
