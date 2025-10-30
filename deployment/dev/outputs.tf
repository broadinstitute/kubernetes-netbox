# instance ID
output "application_instance" {
  value = "${local.application_instance}"
}
# instance database
#output "application_database" {
#  value = module.postgres.instance_connection_name
#}
# instance service account
output "application_service_account" {
  value = module.application_service_accounts.email
}
