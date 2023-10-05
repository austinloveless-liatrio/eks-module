resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.46.4"

  timeout          = 1200
  force_update     = true
  namespace        = "argocd"
  create_namespace = true
}