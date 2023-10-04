data "kubectl_path_documents" "argocd" {
    pattern = file("${path.module}/argo_install.yaml")
}

resource "kubectl_manifest" "argocd" {
    for_each  = toset(data.kubectl_path_documents.argocd.documents)
    yaml_body = each.value
}