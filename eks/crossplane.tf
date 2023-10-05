resource "helm_release" "crossplane" {
  name             = "crossplane-system"
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane"
  verify           = false
}
