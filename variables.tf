variable "digital_ocean_token" {
  type        = string
  description = "The token to used to authenticate to digital ocean"
}
variable "environment" {
  type        = string
  description = "The name of the environment for this Kergiva deployment"
}
variable "image_pull_secret" {
  type        = string
  description = "The image pull secret to use when pulling Kergiva images"
}

###################################
### Infrastructure Remote State ###
###################################
variable "remote_state_token" {
  type        = string
  description = "A cloud token to authenticate with when pulling the Infrastructure remote state"
}
variable "remote_state_organization" {
  type        = string
  description = "The name of the Terraform Cloud organization to pull the infrastructure remote state from"
}
variable "remote_state_workspace" {
  type        = string
  description = "The name of the Terraform Cloud workspace to pull the infrastructure remote state from"
}

###################
### Kergiva Web ###
###################
variable "kergiva_web_domain_name" {
  type        = string
  description = "The DNS name for the deployed Kergiva WEB server"
}
variable "kergiva_web_image_repo" {
  type        = string
  description = "The repo that Kergiva WEB images will be pulled from"
}
variable "kergiva_web_image_name" {
  type        = string
  description = "The name of the Docker image to use in the Kergiva WEB deployment"
}
variable "kergiva_web_image_tag" {
  type        = string
  description = "The Docker image tag to use in the Kergiva API deployment"
}
variable "kergiva_web_chart_version" {
  type        = string
  description = "The Helm chart version to use when deploying the Kergiva WEB service."
}

###################
### Kergiva APP ###
###################
variable "kergiva_app_domain_name" {
  type        = string
  description = "The DNS name for the deployed Kergiva APP server"
}
variable "kergiva_app_image_repo" {
  type        = string
  description = "The repo that Kergiva APP images will be pulled from"
}
variable "kergiva_app_image_name" {
  type        = string
  description = "The name of the Docker image to use in the Kergiva APP deployment"
}
variable "kergiva_app_image_tag" {
  type        = string
  description = "The Docker image tag to use in the Kergiva APP deployment"
}
variable "kergiva_app_chart_version" {
  type        = string
  description = "The Helm chart version to use when deploying the Kergiva APP service."
}

###################
### Kergiva API ###
###################
variable "kergiva_api_domain_name" {
  type        = string
  description = "The DNS name for the deployed Kergiva API server"
}
variable "kergiva_api_image_repo" {
  type        = string
  description = "The repo that Kergiva API images will be pulled from"
}
variable "kergiva_api_image_name" {
  type        = string
  description = "The name of the Docker image to use in the Kergiva API deployment"
}
variable "kergiva_api_image_tag" {
  type        = string
  description = "The Docker image tag to use in the Kergiva API deployment"
}
variable "kergiva_api_chart_version" {
  type        = string
  description = "The Helm chart version to use when deploying the Kergiva API service."
}