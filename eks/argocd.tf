resource "helm_release" "argocd" {
  name             = "argocd"
  chart            = "https://github.com/argoproj/argo-helm/archive/refs/tags/argo-cd-5.46.7.tar.gz"
  namespace        = "argocd"
  create_namespace = true
}