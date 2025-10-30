# Create a service account for Netbox
module "application_service_accounts" {
  source      = "terraform-google-modules/service-accounts/google"
  version     = "4.5.4"
  project_id  = var.core_project
  names       = [local.application_instance]
  description = "service account for Application Pods"
  project_roles = [
    "${var.core_project}=>roles/cloudsql.instanceUser",
    "${var.core_project}=>roles/cloudsql.client",
    "${var.core_project}=>roles/monitoring.viewer",
    "${var.core_project}=>roles/monitoring.metricWriter",
    "${var.core_project}=>roles/iam.serviceAccountTokenCreator",
    "${var.core_project}=>roles/secretmanager.secretAccessor",
  ]
}

resource "google_service_account_iam_member" "application_workload_identity" {
  service_account_id = module.application_service_accounts.service_accounts_map[local.application_instance]["name"]
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gke_project}.svc.id.goog[${var.namespace}/${local.application_instance}]"
  depends_on         = [google_project_service.api_services["compute.googleapis.com"]]
}
