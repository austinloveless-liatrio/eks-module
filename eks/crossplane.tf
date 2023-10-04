resource "helm_release" "crossplane" {
  name             = "crossplane"
  repository       = "https://github.com/crossplane/crossplane/archive/refs/tags/v1.13.2.tar.gz"
  chart            = "crossplane/crossplane"
  namespace        = "crossplane-system"
  create_namespace = true
}