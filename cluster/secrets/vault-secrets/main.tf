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

provider "vault" {
  address = "https://vault:8200"
  token   = var.vault-root
}

resource "random_string" "dex-staticClient-token" {
  length  = 24
  special = false
}

resource "vault_generic_secret" "dex-staticClient-token" {
  path = "secret/dex-staticClient-token"
  data_json = jsonencode({
    token = "${random_string.dex-token.result}"
  })
}