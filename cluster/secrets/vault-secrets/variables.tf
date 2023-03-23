variable "vault_token" {
  type    = string
  default = "${env.VAULT_TOKEN}"
}