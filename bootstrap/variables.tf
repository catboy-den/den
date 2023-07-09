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
  default = "public"
}

variable "flux_repository_description" {
  type    = string
  default = "Flux centric repository that contains declarations for my entire k3s cluster, rapidly integrated and deployed using flux2"
}

variable "flux_repository_homepage" {
  type    = string
  default = "https://weave.catboy.rest"
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
