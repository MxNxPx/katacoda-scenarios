
And, now, let's talk to our cluster: `kubectl get nodes`{{execute}}

Awesome! We're rockin' and rollin'!

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)


Lets deploy something
```
wget https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/deployment.yaml
kubectl apply -f deployment.yaml
kubectl rollout status deployment/nginx-deployment
```{{execute}}

Port forward
`kubectl port-forward --address 0.0.0.0 deployment/nginx-deployment 8080:80`{{execute}}

Check for nginx page
https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

Stop port forward
`^C`{{execute ctrl-seq}}

