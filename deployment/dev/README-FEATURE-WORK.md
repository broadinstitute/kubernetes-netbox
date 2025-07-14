This directory is intended to be used for two purposes.
 1. PR testing prior to merging into main
 2. Engineer feature work for infrastructure changes

In order to accomplish both of these tasks without causing collisions with the above stated purposes, there is one important thing to be aware of.  The terraform variable "instance" must be set accordingly prior to performing any Engineering feature work.

The "instance" variable is curently set via terraform.tfvars to "dev", since that is the value needed for PR testing.  An engineer performing any feature work should follow the following procedures:
 1. Create their own branch from "main"
 2. Edit the file "feature.auto.tfvars" and set "instance" to some identifier for your feature work. (Ex: instance = "update_version")

NOTE: the file "feature.auto.tfvars" is set to be ignored in the .gitignore file in order to ensure feature overrides are not checked into git.
