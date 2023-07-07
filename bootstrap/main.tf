terraform {
  backend "kubernetes" {
    secret_suffix = "den"
    config_path   = "~/.kube/config"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.5.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.10.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = ">=1.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  experiments {
    manifest_resource = true
  }
}

provider "kubectl" {}

provider "github" {
  owner = var.github_organization
  token = var.github_personal_access_token
}

provider "flux" {}
