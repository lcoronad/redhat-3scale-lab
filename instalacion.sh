oc login --server=https://{HOST_OCP}:6443 --username={ADMIN} --password={PASSWORD} --insecure-skip-tls-verify=true

oc new-project poc3scale

oc project poc3scale

oc create -f configmap-consulta-saldo.yml -n poc3scale
oc new-build --binary=true --name=consulta-saldo openshift/java:8 -n poc3scale
oc new-app poc3scale/consulta-saldo:latest --name=consulta-saldo --allow-missing-imagestream-tags=true -n poc3scale
oc set triggers dc/consulta-saldo --remove-all -n poc3scale
oc expose dc consulta-saldo --port 8080 -n poc3scale
oc start-build consulta-saldo --from-file=consulta-saldo-0.0.1-SNAPSHOT.jar --wait=true -n poc3scale
oc rollout latest dc/consulta-saldo -n poc3scale
oc expose svc consulta-saldo -n poc3scale
