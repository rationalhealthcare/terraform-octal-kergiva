#################
## Kergiva.app ##
#################
resource "digitalocean_domain" "kergiva_app" {
  name = "kergiva.app"
}
resource "digitalocean_record" "kergiva_app_primary_record" {
  domain = digitalocean_domain.kergiva_app.name
  name   = "@"
  type   = "A"
  value  = data.terraform_remote_state.infra.outputs.cluster_load_balancer
}
resource "digitalocean_record" "kergiva_app_catch_all_record" {
  domain = digitalocean_domain.kergiva_app.name
  name   = "*"
  type   = "A"
  value  = data.terraform_remote_state.infra.outputs.cluster_load_balancer
}

#################
## Kergiva.org ##
#################
resource "digitalocean_domain" "kergiva_org" {
  name = "kergiva.org"
}
resource "digitalocean_record" "kergiva_org_primary_record" {
  domain = digitalocean_domain.kergiva_org.name
  name   = "@"
  type   = "A"
  value  = data.terraform_remote_state.infra.outputs.cluster_load_balancer
}
resource "digitalocean_record" "kergiva_org_catch_all_record" {
  domain = digitalocean_domain.kergiva_org.name
  name   = "*"
  type   = "A"
  value  = data.terraform_remote_state.infra.outputs.cluster_load_balancer
}