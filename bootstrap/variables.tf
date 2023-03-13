variable "flux_target_path" {
  type        = string
  default     = "flux"
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

variable "github_personal_access_token" {}