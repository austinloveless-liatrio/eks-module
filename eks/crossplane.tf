resource "helm_release" "crossplane_helm" {
  name             = "crossplane-system"
  chart            = "https://github.com/crossplane/crossplane/tree/master/cluster/charts/crossplane"
  verify           = false
}