resource "google_project_service" "secretmanager_api" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_secret_manager_secret" "key" {
  count = var.store_credentials_in_secret_manager ? 1 : 0

  secret_id = "database--${var.database_instance_name}--${var.database_username}--password"

  replication {
    automatic = true
  }
  depends_on = [google_project_service.secretmanager_api]
}

resource "google_secret_manager_secret_version" "key" {
  count = var.store_credentials_in_secret_manager ? 1 : 0

  secret      = google_secret_manager_secret.key[0].id
  secret_data = random_password.password[0].result
  depends_on  = [google_project_service.secretmanager_api]
}


data "google_secret_manager_secret_version" "postgres-password" {
  secret = "database--${var.database_instance_name}--postgres--password"
}