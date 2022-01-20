resource "random_password" "password" {
  length           = 30
  special          = true
  override_special = "_%@"
}

resource "google_sql_user" "user" {
  name     = var.database_username
  password = random_password.password.result
  instance = var.database_instance_name
  type     = var.database_auth_method
}