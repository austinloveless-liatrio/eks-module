resource "helm_release" "crossplane_helm" {
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane-stable"
  version          = "1.13.2"
}