resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://github.com/argoproj/argo-cd/archive/refs/tags/v2.8.4.tar.gz"
  namespace        = "argocd"
  create_namespace = true
}