provider "kubernetes" {
  load_config_file       = false
  host                   = data.terraform_remote_state.infra.outputs.cluster_endpoint
  token                  = data.terraform_remote_state.infra.outputs.cluster_token
  cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.cluster_ca_certificate)
}
provider "k8s" {
  load_config_file       = false
  host                   = data.terraform_remote_state.infra.outputs.cluster_endpoint
  token                  = data.terraform_remote_state.infra.outputs.cluster_token
  cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.cluster_ca_certificate)
}
provider "mysql" {
  endpoint = "${data.terraform_remote_state.infra.outputs.database_remote_host}:${data.terraform_remote_state.infra.outputs.database_port}"
  username = data.terraform_remote_state.infra.outputs.database_username
  password = data.terraform_remote_state.infra.outputs.database_password
}