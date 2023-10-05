# resource "helm_release" "crossplane" {
#   name             = "crossplane-system"
#   chart            = "https://github.com/crossplane/crossplane/tree/master/cluster/charts/crossplane"
#   verify           = false
# }

resource "null_resource" "install_helm" {
  provisioner "local-exec" {
    command = <<-EOT
      curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
      chmod 700 get_helm.sh
      ./get_helm.sh
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "null_resource" "add_crossplane" {
  provisioner "local-exec" {
    command = "helm repo add crossplane-stable https://charts.crossplane.io/stable"
  }
    depends_on = [null_resource.install_helm]
}

resource "null_resource" "install_crossplane" {
  provisioner "local-exec" {
    command = "helm install crossplane --namespace crossplane-system --create-namespace crossplane-stable/crossplane"
  }
  depends_on = [null_resource.add_crossplane]

}

