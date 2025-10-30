# local variables
locals {
  application_instance          = "${var.application_name}-${var.env}"
  application_instance_resource = replace("${var.application_name}-${var.env}", "-", "_")
}
