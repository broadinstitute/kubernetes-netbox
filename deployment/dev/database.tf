# Create a postgres cloudsql instance for application
module "postgres" {
  source                      = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version                     = "26.2.2"
  database_version            = var.application_cloudsql_version
  name                        = local.application_instance
  project_id                  = var.core_project
  user_name                   = var.application_name
  user_password               = data.google_secret_manager_secret_version.netbox_db_password.secret_data
  db_name                     = var.application_name
  deletion_protection         = false # todo: Used to block Terraform from deleting a SQL Instance. - Set to false for now
  deletion_protection_enabled = false # todo: Enables protection of an instance from accidental deletion across all surfaces (API, gcloud, Cloud Console and Terraform). - Set to false for now
  enable_default_db           = true
  database_flags = [
    {
      name  = "cloudsql.iam_authentication",
      value = "on",
    },
  ]
  region  = var.region
  edition = "ENTERPRISE"
  tier    = var.application_cloudsql_tier

  ip_configuration = {
    ssl_mode = "ENCRYPTED_ONLY"
  }

  iam_users = [
    {
      id    = var.application_name,
      email = module.application_service_accounts.service_accounts_map[local.application_instance]["email"],
    },
  ]
}
