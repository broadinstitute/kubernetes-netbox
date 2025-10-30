provider "google" {
  project = var.core_project
  region  = var.region
}

provider "google-beta" {
  project = var.core_project
  region  = var.region
}
