mkdir -p /var/lib/katacoda

kubectl rollout history deploy/nginx-deployment -o jsonpath='{.metadata.annotations.kubectl\.kubernetes\.io\/last-applied-configuration}' | jq ".spec.template.spec.containers[0].image" > /var/lib/katacoda/step2.out
egrep "^nginx:1.14.2" /var/lib/katacoda/step2.out
