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
    client_id               = var.github_oauth_client_id
    client_secret           = var.github_oauth_client_secret
    organization            = var.github_organization
  }

  type = "Opaque"
}