# Input variables to accept values from the calling module
# https://www.terraform.io/docs/modules/#standard-module-structure
variable "api_services" {
  description = "List of API services to enable"
  type        = list(string)
  default = [
    "bigquery.googleapis.com",
    "cloudidentity.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "iap.googleapis.com",
    "iamcredentials.googleapis.com",
    "monitoring.googleapis.com",
    "networkconnectivity.googleapis.com",
    "secretmanager.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "storage.googleapis.com",
    "sts.googleapis.com",
  ]
}

variable "core_project" {
  description = "GCP project to use for the default/primary provider"
  type        = string
}

variable "gke_project" {
  description = "google project where GKE cluster resides"
  type        = string
}

variable "env" {
  description = "application environment"
  type        = string
}

variable "namespace" {
  description = "GKE namespace where application will be deployed"
  type        = string
}

variable "region" {
  default     = "us-east4"
  description = "The default region in which resources will be created"
  type        = string
}

# Below are application specific variables and defaults

variable "application_name" {
  default     = ""
  description = "application name"
  type        = string
}

variable "application_cloudsql_tier" {
  default     = "db-f1-micro"
  description = "Cloudsql instance size for application database"
  type        = string
}

variable "application_cloudsql_version" {
  default     = ""
  description = "Cloudsql instance version for application database"
  type        = string
}

variable "application_service_account" {
  default     = ""
  description = "Name of service account that application will run as"
  type        = string
}

variable "application_bucket" {
  default     = ""
  description = "Name of bucket where wdls will reside"
  type        = string
}
