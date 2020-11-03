locals {
  project_name        = "kergiva"
  project_description = "ArgoCD project for Kergiva"

  instance_name = "${local.project_name}-${local.environment_map[var.environment]}"

  environment_map = {
    prd         = "prd"
    prod        = "prd"
    production  = "prd"
    stg         = "stg"
    stage       = "stg"
    dev         = "dev"
    development = "dev"
  }
}