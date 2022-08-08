resource "google_sql_database" "database" {
  count = var.create_database ? 1 : 0

  name     = var.database_name
  instance = var.database_instance_name

  lifecycle {
    prevent_destroy = true
  }

}