resource "kubectl_manifest" "crossplane" {
    yaml_body = file("${path.module}/crossplane_install.yaml")
    depends_on = [data.http.wait_for_cluster]
}