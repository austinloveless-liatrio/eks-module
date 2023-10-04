# resource "helm_release" "crossplane_helm" {
#   name             = "crossplane-system"
#   repository       = "https://charts.crossplane.io/stable"
#   chart            = "crossplane-stable"
#   version          = "1.13.2"
#   verify           = false
# }