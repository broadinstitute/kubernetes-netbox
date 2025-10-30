#
# database password
#
resource "random_password" "netbox_db_password" {
  length           = 16
  special          = true
  override_special = "!@#$%^&*" # Optional: Specify custom special characters
}

resource "google_secret_manager_secret" "netbox_db_password" {
  secret_id = "${local.application_instance_resource}_netbox_db_password"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "netbox_db_password" {
  secret         = google_secret_manager_secret.netbox_db_password.name
  secret_data_wo = random_password.netbox_db_password.result
}

data "google_secret_manager_secret_version" "netbox_db_password" {
  secret  = google_secret_manager_secret.netbox_db_password.name
  version = "1"
}
