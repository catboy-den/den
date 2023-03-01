variable "cluster_primary_namespace" {
  type        = string
  default     = "catboy-den"
  description = "Primary namespace the cluster will use fairly frequently"
}

variable "cluster_domain" {
  type        = string
  default     = "catboy.rest"
  description = "Common domain used by the cluster"
}

variable "cluster_email" {
  type        = string
  default     = "thetwinkehh@gmail.com"
  description = "Common email the cluster can use for general configs"
}

variable "flux_target_path" {
  type        = string
  default     = "cluster"
  description = "Relative path to the Git repository root where Flux manifests are committed."
}

variable "flux_repository_name" {
  type    = string
  default = "den"
}

variable "flux_repository_visibility" {
  type    = string
  default = "private"
}

variable "flux_repository_branch" {
  type    = string
  default = "main"
}

variable "github_organization" {
  type    = string
  default = "catboy-den"
}

variable "github_oauth_client_id" {}
variable "github_oauth_client_secret" {}
variable "github_personal_access_token" {}