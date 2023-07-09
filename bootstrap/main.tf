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
provider "github" {
  owner = var.github_organization
  token = var.github_personal_access_token
}

resource "tls_private_key" "main" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
  git = {
    url = "ssh://git@github.com/${github_repository.this.full_name}.git"
    ssh = {
      username    = "git"
      private_key = tls_private_key.main.private_key_pem
    }
  }
}

resource "github_repository" "this" {
  name         = var.flux_repository_name
  visibility   = var.flux_repository_visibility
  description  = var.flux_repository_description
  homepage_url = var.flux_repository_homepage
  auto_init    = true
}

resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = var.flux_repository_branch
}

resource "github_repository_deploy_key" "this" {
  title      = "flux-cluster"
  repository = github_repository.this.name
  key        = tls_private_key.main.public_key_openssh
  read_only  = false
}

resource "flux_bootstrap_git" "this" {
  depends_on       = [github_repository_deploy_key.this]
  path             = var.flux_target_path
  components_extra = ["image-reflector-controller", "image-automation-controller"]
}

resource "github_team" "admin_team" {
  name        = "cluster-admin"
  description = "Administration team for this organizations flux cluster"
  privacy     = "closed"
}

resource "github_team" "user_team" {
  name        = "cluster-user"
  description = "User or read-only team for this organizations flux cluster"
  privacy     = "closed"
}
