terraform {
  backend "gcs" {}
  required_version = "> 1.0.0"
}

provider "google" {
  alias = "impersonation"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

data "google_service_account_access_token" "default" {
  provider               = google.impersonation
  target_service_account = var.terraform_service_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "1200s"
}

provider "gcp" {
  region          = var.gcp_region
  project         = var.gcp_project_id
  access_token    = data.google_service_account_access_token.default.access_token
  request_timeout = "60s"
}