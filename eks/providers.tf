terraform {
    backend "kubernetes" {
      secret_suffix     = "providerconfig-tf-aws"
      namespace         = "crossplane-system"
      in_cluster_config = true
    }
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
            version = "= 2.11.0"
        }
        null = {
          source = "hashicorp/null"
          version = "3.2.1"
        }
        aws = {
          source  = "hashicorp/aws"
          version = "~> 4.0"
        }
    }
}
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}


provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
  load_config_file       = false
}

provider "null" {}

provider "aws" {
  region  = "us-east-1"
}