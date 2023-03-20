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
  }
}

output "vault_token_value" {
  value = lookup(env, "VAULT_TOKEN")
}

/* 
provider "vault" {
  address   = local.vault_addr
  token     = local.vault_token
  namespace = local.vault_namespace
} */