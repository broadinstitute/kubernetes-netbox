
[Terraform Docs](https://terraform-docs.io/) created by running:

```Shell
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:latest --output-file README.md --output-mode inject /terraform-docs
```

Remember update the dependency lock file for different architectures:

```Shell
terraform providers lock -platform=linux_amd64 -platform=darwin_amd64 -platform=darwin_arm64 -platform=windows_amd64
```

When applying on a brand new google project that does not have any of the Google APIs enabled, you must first enable the compute.googleapi.com before terraform is able to successfully apply the first time.  This is due to how the [Google SqlDB Terrform module](https://github.com/terraform-google-modules/terraform-google-sql-db/tree/main) is implemented.  The module has a data resource that queries the google project for list of available compute zones, which requires compute.googleapi.com to be enabled.  

NOTE: as of terraform provider version 6.38.0 and cloudsql module version 25.2.2 running terraform apply or plan will cause the following Warning that is safe to ignore
`Warning: Available Write-only Attribute Alternative`

```Shell
terraform init
terraform apply --target='google_project_service.api_services["compute.googleapis.com"]'
```

An alternative method is to use the Google SDK CLI.
```Shell
gcloud services enable compute.googleapis.com --project=REPLACE_WITH_GOOGLE_PROJECT_NAME
```
