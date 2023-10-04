resource "helm_release" "argocd" {
  name             = "argocd"
  chart            = "argocd/argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"
}