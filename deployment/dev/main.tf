# Enable APIs
resource "google_project_service" "api_services" {
  for_each                   = toset(var.api_services)
  project                    = var.core_project
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}

# Some API enablement takes time to complete its background tasks.  However
# from a terraform perspecitive the resources so complete.  This is true for
# the first time the compute API is enabled.  This time_sleep will sleep
# for some seconds once the listed APIs have all been enabled.
resource "time_sleep" "wait_for_api" {
  create_duration = "60s"

  depends_on = [
    google_project_service.api_services["compute.googleapis.com"],
  ]
}
