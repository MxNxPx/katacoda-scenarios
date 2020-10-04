mkdir -p /var/lib/katacoda

kubectl get deploy/nginx-deployment -o jsonpath='{.status.availableReplicas}' > /var/lib/katacoda/step1.out
egrep "^2" /var/lib/katacoda/step1.out
