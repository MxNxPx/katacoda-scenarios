---

## Kubernetes 105, Section 3: Referencing Secrets

---


The deploy3.yml file contains Apache tomcat deployment information and the secrets from secret.yml. 

Display the contents of deploy3.yml.

`cat deploy3.yml; echo;echo`{{execute}}


Now, apply the Deployment and the Service:

`kubectl apply -f deploy3.yml`{{execute}}
