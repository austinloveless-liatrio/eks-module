
data "aws_eks_cluster" "this" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

data "http" "wait_for_cluster" {
  url            = format("%s/healthz", module.eks.cluster_endpoint)
  ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  timeout        = 1200

  depends_on = [
    module.eks
  ]
}

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
  load_config_file       = false
}

locals {
  aws_user_role = "arn:aws:iam::${var.accountId}:role/Administrator"
  aws_terraform_role = "arn:aws:iam::${var.accountId}:role/provider-aws"

  aws_auth_configmap_yaml = <<-EOT
  ${chomp(module.eks.aws_auth_configmap_yaml)}
      - rolearn: ${local.aws_user_role}
        username: "provider-aws"
        groups:
          - system:masters
      - rolearn: ${local.aws_terraform_role}
        username: "sandbox-admin"
        groups:
          - system:masters
  EOT
}

resource "kubectl_manifest" "aws_auth" {
  yaml_body = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    app.kubernetes.io/managed-by: Terraform
  name: aws-auth
  namespace: kube-system
${local.aws_auth_configmap_yaml}
YAML

depends_on = [data.http.wait_for_cluster]
}