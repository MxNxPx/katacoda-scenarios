## Working with Namespaces

---

Namespaces are a Kubernetes logical construct used for separating Kubernetes resources.


Let's see which namespace kubectl is configured to operate in using the "ns" krew plugin

`kubectl ns -c`{{execute}}

> _“default”_


Create a new namespace

`kubectl create ns sandbox`{{execute}}

> _“namespace/sandbox created”_


Execute the command below to list the namespaces in the cluster

`kubectl get namespace`{{execute}}
