module "backup-bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 12.0.0"

  name       = "${local.application_instance}-backups"
  project_id = var.core_project
  location   = var.region
  iam_members = [{
    role   = "roles/storage.admin"
    member = "serviceAccount:${module.application_service_accounts.service_accounts_map[local.application_instance]["email"]}"
  }]
}

module "media-bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 12.0.0"

  name       = "${local.application_instance}-media"
  project_id = var.core_project
  location   = var.region
  iam_members = [{
    role   = "roles/storage.admin"
    member = "serviceAccount:${module.application_service_accounts.service_accounts_map[local.application_instance]["email"]}"
  }]
}

module "reports-bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 12.0.0"

  name       = "${local.application_instance}-reports"
  project_id = var.core_project
  location   = var.region
  iam_members = [{
    role   = "roles/storage.admin"
    member = "serviceAccount:${module.application_service_accounts.service_accounts_map[local.application_instance]["email"]}"
  }]
}
