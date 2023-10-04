resource "helm_release" "crossplane_helm" {
  name             = "crossplane-system"
  chart            = "crossplane/crossplane-stable"
  version          = "1.13.2"
  verify           = false
}