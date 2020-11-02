module "kergiva_api" {
  source = "github.com/rationalhealthcare/terraform-octal-kergiva-api?ref=main"

  cluster_endpoint         = "https://kubernetes.default.svc"
  cluster_cert_issuer      = data.terraform_remote_state.infra.outputs.cluster_cert_issuer
  cluster_ingress_class    = data.terraform_remote_state.infra.outputs.cluster_ingress_class
  cluster_argocd_namespace = data.terraform_remote_state.infra.outputs.cluster_argocd_namespace

  project_name      = module.project.name
  environment       = local.environment_map[var.environment]
  namespace         = kubernetes_namespace.rational_healthcare.metadata.0.name
  domain_name       = var.kergiva_api_domain_name
  chart_version     = var.kergiva_api_chart_version
  image_repo        = var.kergiva_api_image_repo
  image_name        = var.kergiva_api_image_name
  image_tag         = var.kergiva_api_image_tag
  image_pull_secret = kubernetes_secret.secret.metadata.0.name
  database_host     = data.terraform_remote_state.infra.outputs.database_host
  database_port     = data.terraform_remote_state.infra.outputs.database_port
  database_name     = mysql_database.kergiva_api_db.name
  database_username = mysql_user.kergiva_api_db_user.user
  database_password = mysql_user.kergiva_api_db_user.password
}