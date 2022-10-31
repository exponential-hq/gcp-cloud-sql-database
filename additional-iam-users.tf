resource "postgresql_grant" "additional_iam_user_grants" {
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
