---

## Kubernetes 105, Section 3: Referencing Secrets

---


The tomcat-deploy-svc.yaml file contains Apache tomcat deployment information and the secrets from secret.yml. 

Display the contents of tomcat-deploy-svc.yaml.

`cat tomcat-deploy-svc.yaml; echo;echo`{{execute}}


Now, apply the Deployment and the Service:

`kubectl apply -f tomcat-deploy-svc.yaml`{{execute}}
