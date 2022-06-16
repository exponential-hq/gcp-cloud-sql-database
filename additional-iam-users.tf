resource "postgresql_grant_role" "grant_iam_superuser" {
  count      = length(var.additional_iam_users)
  role       = var.additional_iam_users[count.index]
  grant_role = "cloudsqlsuperuser"
}

resource "postgresql_grant" "grant_iam" {
  count       = length(var.additional_iam_users)
  database    = var.database_name
  role        = var.additional_iam_users[count.index]
  schema      = "public"
  object_type = "table"
  objects     = []
  privileges  = ["INSERT", "SELECT", "UPDATE", "DELETE"]

  depends_on = [
    google_sql_database.database,
  ]
}