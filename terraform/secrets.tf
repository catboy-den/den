# Install kubed, for syncing secrets across namespaces
resource "helm_release" "kubed" {
  name            = "kubed"
  repository      = "https://charts.appscode.com/stable/"
  chart           = "kubed"
  namespace       = "kube-system"
  cleanup_on_fail = true
}

# Create github-info secret
resource "kubernetes_secret" "github-info" {
  depends_on = [
    helm_release.kubed
  ]

  metadata {
    name      = "github-info"
    namespace = "default"
    annotations = {
      "kubed.appscode.com/sync" : "true"
    }
  }

  data = {
    organization          = var.github_organization
    client_id             = var.github_oauth_client_id
    client_secret         = var.github_oauth_client_secret
    personal_access_token = var.github_personal_access_token
  }

  type = "Opaque"
}

# Create cluster-info secret
resource "kubernetes_secret" "cluster-info" {
  depends_on = [
    helm_release.kubed
  ]

  metadata {
    name      = "cluster-info"
    namespace = "kube-system"
    annotations = {
      "kubed.appscode.com/sync" : "true"
    }
  }

  data = {
    primary_namespace = var.cluster_primary_namespace
    domain            = var.cluster_domain
    email             = var.cluster_email
  }

  type = "Opaque"
}