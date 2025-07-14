# https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files
# Terraform automatically loads variable definition from this file.
# Use this file to override variable defaults set in variables.tf
# ex. foo = "bar"

core_project                 = "broad-netbox-dev"
instance                     = "dev"
namespace                    = "broad-netbox-dev"
gke_project                  = "bits-gke-clusters"
application_cloudsql_version = "POSTGRES_14"
application_name             = "netbox"
