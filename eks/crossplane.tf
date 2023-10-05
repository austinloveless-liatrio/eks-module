resource "helm_release" "crossplane" {
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane"
  verify           = false
  namespace        = "crossplane-system"
  create_namespace = true

  values = [
    "${file("${path.module}/values.yaml")}"
  ]

}
