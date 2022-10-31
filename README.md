# gcp-cloud-sql-database

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 1.0.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.30.0 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | 1.17.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.41.0 |
| <a name="provider_google.impersonation"></a> [google.impersonation](#provider\_google.impersonation) | 4.41.0 |
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | 1.17.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_service.secretmanager_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_secret_manager_secret.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_sql_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_user.iam_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [google_sql_user.user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [postgresql_grant.additional_iam_user_grants](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.17.1/docs/resources/grant) | resource |
| [postgresql_grant.grant_iam_user](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.17.1/docs/resources/grant) | resource |
| [postgresql_grant_role.grant_iam_user_role](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.17.1/docs/resources/grant_role) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [google_secret_manager_secret_version.postgres-password](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [google_sql_database_instance.database_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/sql_database_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_iam_users"></a> [additional\_iam\_users](#input\_additional\_iam\_users) | List of IAM users to allow permission to the database | `list(any)` | `[]` | no |
| <a name="input_create_database"></a> [create\_database](#input\_create\_database) | Create a database | `bool` | `true` | no |
| <a name="input_database_auth_method"></a> [database\_auth\_method](#input\_database\_auth\_method) | Auth mehod to set up for the user (BUILT\_IN \| CLOUD\_IAM\_USER \| CLOUD\_IAM\_SERVICE\_ACCOUNT) | `string` | `"CLOUD_IAM_SERVICE_ACCOUNT"` | no |
| <a name="input_database_instance_name"></a> [database\_instance\_name](#input\_database\_instance\_name) | Name of the database instance on which to provision resources | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the database to be created | `string` | n/a | yes |
| <a name="input_database_username"></a> [database\_username](#input\_database\_username) | Name of the database user to be created | `string` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | ID of the project to use for the GCP provider | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region for the GCP provider | `string` | n/a | yes |
| <a name="input_grant_roles"></a> [grant\_roles](#input\_grant\_roles) | Roles to grant to the user | `list(string)` | <pre>[<br>  "cloudsqlsuperuser"<br>]</pre> | no |
| <a name="input_store_credentials_in_secret_manager"></a> [store\_credentials\_in\_secret\_manager](#input\_store\_credentials\_in\_secret\_manager) | Whether to store the credentials into GCP Secret Manager | `bool` | `false` | no |
| <a name="input_terraform_service_account"></a> [terraform\_service\_account](#input\_terraform\_service\_account) | Name of the service account to assume to run Terraform | `string` | n/a | yes |
| <a name="input_user_grants"></a> [user\_grants](#input\_user\_grants) | Grants to assign to the user | `list(any)` | <pre>[<br>  "DELETE",<br>  "INSERT",<br>  "REFERENCES",<br>  "SELECT",<br>  "TRIGGER",<br>  "TRUNCATE",<br>  "UPDATE"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_instance_name"></a> [database\_instance\_name](#output\_database\_instance\_name) | n/a |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | n/a |
| <a name="output_database_username"></a> [database\_username](#output\_database\_username) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
