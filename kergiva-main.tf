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
  source = "github.com/turnbros/terraform-argocd-project?ref=v1.0.0"

  argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace
  name             = local.instance_name
  description      = local.project_description
  destinations = [
    {
      server    = "https://kubernetes.default.svc"
      namespace = kubernetes_namespace.rational_healthcare.metadata.0.name
    }
  ]
  oidc_group_role_membership = {
    "argocd-kergiva-developers" = [
      "argocd-kergiva-developers"
    ]
  }
  roles = [
    {
      name = "argocd-kergiva-developers"
      description = "A role for the developers of Kergiva"
      policies = [
        "p, proj:${local.instance_name}:read-only, applications, get, ${local.instance_name}/*, allow"
      ]
    }
  ]
}