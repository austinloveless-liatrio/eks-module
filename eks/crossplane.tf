resource "helm_release" "crossplane" {
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/master/"
  chart            = "crossplane/crossplane"
  namespace        = "crossplane-system"
  create_namespace = true
}