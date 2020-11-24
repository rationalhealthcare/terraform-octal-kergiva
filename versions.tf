terraform {
  required_version = ">= 0.13"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    k8s = {
      source  = "banzaicloud/k8s"
      version = "0.8.0"
    }
    mysql = {
      source = "terraform-providers/mysql"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "turnbros"

    workspaces {
      prefix = "homestead-kergiva-"
    }
  }
}
