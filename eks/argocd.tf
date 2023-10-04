resource "kubectl_manifest" "argocd" {
    yaml_body = file("${path.module}/argocd_install.yaml")
    depends_on = [data.http.wait_for_cluster]
}