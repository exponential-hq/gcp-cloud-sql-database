resource "google_sql_database" "database" {
  name     = var.database_name
  instance = var.database_instance_name
}