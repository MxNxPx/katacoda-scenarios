## Kubernetes 105, Section 3: Referencing Secrets

---

**WARNING - YOU HAVE LESS THAN 1 HOUR BEFORE YOUR SESSION EXPIRES!**

>Note the time left (in HH:MM) for the session, it is in your prompt and updated after every command run:

![Terminal Time Remaining](./assets/term-expire.png)

---

## Secrets Tomcat Deployment 


The deploy3.yml file contains Apache tomcat deployment information and the secrets from secret.yml. 

Display the contents of deploy3.yml.

`cat deploy3.yml
`{{execute}}


Now, apply the Deployment and the Service:

`kubectl apply -f deploy3.yml
`{{execute}}
