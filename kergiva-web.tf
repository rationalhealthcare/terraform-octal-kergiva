module "kergiva_web" {
  source = "github.com/rationalhealthcare/terraform-octal-kergiva-web?ref=v1.0.0"

  cluster_endpoint         = "https://kubernetes.default.svc"
  cluster_cert_issuer      = data.terraform_remote_state.infra.outputs.cluster_cert_issuer
  cluster_ingress_class    = data.terraform_remote_state.infra.outputs.cluster_ingress_class
  cluster_argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace

  project_name      = module.project.name
  namespace         = kubernetes_namespace.rational_healthcare.metadata.0.name
  domain_name       = var.kergiva_web_domain_name
  chart_version     = var.kergiva_web_chart_version
  image_repo        = var.kergiva_web_image_repo
  image_name        = var.kergiva_web_image_name
  image_tag         = var.kergiva_web_image_tag
  image_pull_secret = kubernetes_secret.secret.metadata.0.name
}