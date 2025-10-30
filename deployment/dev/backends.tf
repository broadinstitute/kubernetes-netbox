terraform {
  backend "gcs" {
    bucket = "broad-atlantis-terraform-prod"
    prefix = "netbox/dev"
  }
}
