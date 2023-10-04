resource "kubectl_manifest" "argocd" {
    yaml_body = file("https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml")
    depends_on = [data.http.wait_for_cluster]
}