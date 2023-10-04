resource "helm_release" "crossplane" {
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane-stable"
  namespace        = "crossplane-system"
  create_namespace = true

}