resource "google_secret_manager_secret" "key" {
  count = var.store_credentials_in_secret_manager ? 1 : 0

  secret_id = "database--${var.database_instance_namen}--${var.database_username}--password"

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "key" {
  count = var.store_credentials_in_secret_manager ? 1 : 0

  secret      = google_secret_manager_secret.key[0].id
  secret_data = random_password.password.result
}