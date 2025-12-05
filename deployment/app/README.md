
Updating the application after the initial deploy requires passing some additional password values to the `helmfile apply` command.

Below are some shell commands that can be used for manual deploys

 export VALKEY_PASSWORD=$(kubectl get secret --namespace <NAMESPACE>  netbox-<INSTANCE>-valkey -o jsonpath="{.data.valkey-password}" | base64 -d)

 export PASSWORD=$(kubectl get secret --namespace <NAMESPACE> netbox-<INSTANCE>-superuser -o jsonpath="{.data.password}" | base64 -d)

helmfile --set global.valkey.password=$VALKEY_PASSWORD --set superuser.password=$PASSWORD apply
