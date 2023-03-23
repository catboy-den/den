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
      source = "MorganPeat/environment"
      version = ">= 0.1.4"
    }
  }
}

data "environment_variable" "vault_token" {
  name = "VAULT_TOKEN"
}
output "VAULT_TOKEN" {
  value = data.environment_variable.vault_token.value
  sensitive = true
}
provider "vault" {
  address = "https://vault:8200"
  token   = data.env_variable.vault_token.value
}

resource "vault_generic_secret" "example_secret" {
  path = "secret/example"
  data = {
    username = "myuser"
    password = "mypassword"
  }
}

output "example_secret" {
  value = vault_generic_secret.example_secret.data
}

/* 
provider "vault" {
  address   = local.vault_addr
  token     = local.vault_token
  namespace = local.vault_namespace
} */