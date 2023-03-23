variable "vault-root" {
  type = string
  sensitive = true
}

variable "ca.cert" {
  type    = string
  sensitive = true
}

variable "ca.key" {
  type    = string
  sensitive = true
}