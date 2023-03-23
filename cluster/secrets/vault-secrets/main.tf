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
  ca_cert = var.vault_ca_cert
  ca_path = var.vault_ca_key
}

resource "vault_generic_secret" "example_secret" {
  path = "secret/example"
  data_json = jsonencode({
    username = "myuser-new"
    password = "mypassword"
  })
}
