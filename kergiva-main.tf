resource "kubernetes_namespace" "rational_healthcare" {
  metadata {
    name = local.instance_name
  }
}

resource "kubernetes_secret" "secret" {
  metadata {
    name      = "regcred"
    namespace = kubernetes_namespace.rational_healthcare.metadata.0.name
  }
  data = {
    ".dockerconfigjson" : base64decode(var.image_pull_secret)
  }
  type = "kubernetes.io/dockerconfigjson"
}

module "project" {
  source = "github.com/project-octal/terraform-argocd-project?ref=v1.0.1"

  argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace
  name             = local.instance_name
  description      = local.project_description
  destinations = [
    {
      server    = "https://kubernetes.default.svc"
      namespace = kubernetes_namespace.rational_healthcare.metadata.0.name
    }
  ]
  permissions = [
    {
      name = "developer-read-only"
      description = "A read-only role for the developers of Kergiva"
      policies = [
        {
          resource = "applications"
          action = "get"
          object = "*"
        }
      ]
      oidc_groups = [
        "argocd-kergiva-developers"
      ]
    }
  ]
}