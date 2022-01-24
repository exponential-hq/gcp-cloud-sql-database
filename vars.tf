variable "gcp_project_id" {
  description = "ID of the project to use for the GCP provider"
  type        = string
}

variable "gcp_region" {
  description = "Region for the GCP provider"
  type        = string
}

variable "database_auth_method" {
  description = "Auth mehod to set up for the user (BUILT_IN | CLOUD_IAM_USER | CLOUD_IAM_SERVICE_ACCOUNT)"
  type        = string
  default     = "BUILT_IN"
}

variable "database_instance_name" {
  description = "Name of the database instance on which to provision resources"
  type        = string
}

variable "database_instance_ip" {
  description = "IP address of the database instance"
  type        = string
}

variable "database_name" {
  description = "Name of the database to be created"
  type        = string
}

variable "database_username" {
  description = "Name of the database user to be created"
  type        = string
}

variable "store_credentials_in_secret_manager" {
  description = "Whether to store the credentials into GCP Secret Manager"
  type        = bool
  default     = false
}

variable "terraform_service_account" {
  description = "Name of the service account to assume to run Terraform"
  type        = string
}