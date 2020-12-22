## Kubernetes 104, Section 2: Creating and Referencing a ConfigMap

---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

---
## ConfigMap Overview

A ConfigMap is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume.

A ConfigMap allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.

![ConfigMap](./assets/K8's-Config-Map.png)

---

## Creating and Referencing a ConfigMap Demo

Step 1:
Display the contents of config-map.yml to see what's inside.

`cat config-map.yml
`{{execute}}

Step 2:
Deploy ConfigMap.

`kubectl apply -f config-map.yml
`{{execute}}

Step 3:
Now deploy the below yml file, this will reference the configmap in your deployment and deploy the service.

`kubectl apply -f configmap-dep2.yml
`{{execute}}

Step 4:
Test connectivity to nginx: Please note, if the pod fails to connect, wait for about 2 minutes. 
`kubectl run -n default -i --rm --restart=Never curl-test --generator=run-pod/v1 --image=radial/busyboxplus:curl -- sh -c "curl -vvv hello-service-a123456.default.svc.cluster.local"
`{{execute}}

pod "curl-test" deleted
