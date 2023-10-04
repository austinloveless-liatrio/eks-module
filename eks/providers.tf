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
    config_path = "~/.kube/config"
  }
}