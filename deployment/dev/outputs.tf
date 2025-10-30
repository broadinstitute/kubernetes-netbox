# instance ID
output "application_instance" {
  value = local.application_instance
}
# instance database
output "application_database" {
  value = module.postgres.instance_connection_name
}
# instance database password secret
output "application_database_password_secret" {
  value = google_secret_manager_secret.netbox_db_password.secret_id
}
# instance service account
output "application_service_account" {
  value = module.application_service_accounts.email
}
# google project
output "application_google_project" {
  value = var.core_project
}
