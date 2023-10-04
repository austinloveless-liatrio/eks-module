terraform {
    required_providers {
        kubectl = {
            source = "gavinbunney/kubectl"
            version = "1.14.0"
        }
        http = {
            source  = "terraform-aws-modules/http"
            version = "2.4.1"
        }
        helm = {
            source  = "hashicorp/helm"
            version = "= 2.5.1"
        }
    }
}
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
    load_config_file       = false
    }
}


provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
  load_config_file       = false
}