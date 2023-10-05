resource "helm_release" "crossplane" {
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane"
  verify           = false
  namespace        = "crossplane-system"
  create_namespace = true

  timeout      = 1200
  force_update = true
}
