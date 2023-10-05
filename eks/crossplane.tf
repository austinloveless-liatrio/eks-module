# resource "helm_release" "crossplane" {
#   name             = "crossplane-system"
#   chart            = "https://github.com/crossplane/crossplane/tree/master/cluster/charts/crossplane"
#   verify           = false
# }

resource "null_resource" "add_crossplane" {
  provisioner "local-exec" {
    command = "helm repo add crossplane-stable https://charts.crossplane.io/stable"
  }
}

resource "null_resource" "install_crossplane" {
  provisioner "local-exec" {
    command = "helm install crossplane --namespace crossplane-system --create-namespace crossplane-stable/crossplane"
  }
  depends_on = [null_resource.add_crossplane]

}

