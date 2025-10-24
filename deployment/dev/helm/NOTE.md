          export VALKEY_PASSWORD=$(kubectl get secret --namespace "broad-netbox-dev" netbox-hjf-valkey -o jsonpath="{.data.valkey-password}" | base64 -d)

          export PASSWORD=$(kubectl get secret --namespace "broad-netbox-dev" netbox-hjf-superuser -o jsonpath="{.data.password}" | base64 -d)

--set global.valkey.password=$VALKEY_PASSWORD
--set superuser.password=$PASSWORD
