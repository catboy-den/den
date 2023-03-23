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
    env = {
      source = "tchupp/env"
      version = "0.0.2"
    }
  }
}

data "env_variable" "vault_token" {
  name  = "VAULT_TOKEN"
}

output "vault_token" {
  value = data.env_variable.vault_token.value
}

provider "vault" {
  address = "https://vault:8200"
  token   = data.env_variable.vault_token.value
}

/* 
provider "vault" {
  address   = local.vault_addr
  token     = local.vault_token
  namespace = local.vault_namespace
} */