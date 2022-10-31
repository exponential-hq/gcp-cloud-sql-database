locals {
  iam_username = "${var.database_username}@${var.gcp_project_id}.iam"
}

resource "random_password" "password" {
  count   = var.database_auth_method == "BUILT_IN" ? 1 : 0
  length  = 30
  special = false
}

resource "google_sql_user" "user" {
  count    = var.database_auth_method == "BUILT_IN" ? 1 : 0
  name     = var.database_username
  password = random_password.password[0].result
  instance = var.database_instance_name
  type     = var.database_auth_method
}



resource "google_sql_user" "iam_user" {
  count    = var.database_auth_method == "CLOUD_IAM_SERVICE_ACCOUNT" ? 1 : 0
  name     = local.iam_username
  instance = var.database_instance_name
  type     = var.database_auth_method
}

resource "postgresql_grant" "grant_iam_user" {
  count = var.database_auth_method == "CLOUD_IAM_SERVICE_ACCOUNT" ? 1 : 0

  database    = var.database_name
  role        = local.iam_username
  schema      = "public"
  object_type = "table"
  objects     = []
  privileges  = var.user_grants

  depends_on = [
    google_sql_database.database,
    google_sql_user.iam_user,
  ]
}

resource "postgresql_grant_role" "grant_iam_user_role" {
  for_each   = { for k in toset(var.grant_roles) : k => k if var.database_auth_method == "CLOUD_IAM_SERVICE_ACCOUNT" }
  role       = local.iam_username
  grant_role = each.key

  depends_on = [
    google_sql_user.iam_user,
  ]
}
