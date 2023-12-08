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

resource "random_string" "dex-staticClient-secret" {
  length  = 24
  special = false
}

resource "random_string" "grafana-admin" {
  length  = 24
  special = false
}

resource "vault_generic_secret" "dex-staticClient-secret" {
  path = "secret/dex-staticClient-secret"
  data_json = jsonencode({
    secret = "${random_string.dex-staticClient-secret.result}"
  })
}

resource "vault_generic_secret" "grafana-admin" {
  path = "secret/grafana-admin"
  data_json = jsonencode({
    password = "${random_string.grafana-admin.result}"
  })
}

variable "vault-root" {
  type      = string
  sensitive = true
}

