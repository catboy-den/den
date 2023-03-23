terraform {
  required_version = "~> 1.0"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 2.22"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.4.1"
    }
    environment = {
      source = "EppO/environment"
      version = ">= 1.3.4"
    }
  }
}

data "environment_variables" "vault_token" {
  filter    = "VAULT_TOKEN"
}

output "vault_token" {
  value = data.environment_variables.vault_token.items
}

/* 
provider "vault" {
  address   = local.vault_addr
  token     = local.vault_token
  namespace = local.vault_namespace
} */